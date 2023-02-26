clear
clc
close all
%% Try to condense experimental imagery data
% No need to have so many visible/infrared images since lidar took pictures
% at lower frequency


%% What experiment to look at?
type = "fog";              % "baseline" or "fog"
experimentName = "fog01";   % "baseline01", "baseline02", "fog01", etc.

%% Get imagery (visible, IR, lidar) data and timings
imagery_data = findImageNames(type, experimentName);
[imagery_data, timing_info] = getCameraTimings(imagery_data);

%% For every lidar image -- produce an interpolated visible and IR image

%% Have to change this line every experiment
% To access lidar point clouds
original_folder = "Glenn I Data\Fog Data\"  + experimentName + "\" ...
                  + experimentName + "\Lidar\";

% Create new folder (in Box) for condensing shenanigans
new_folder = "Glenn I Data\Andy Blah\" + experimentName + "_condensed\";
mkdir(new_folder)

% Test copy file mechanism
copyfile(original_folder + imagery_data.lidar_csvs(1), new_folder + "test_copyfile.csv")

% Save file for new timing data
timingInfo.startOfExp.unix = timing_info.firstTimeUnix;
timingInfo.startOfExp.datetime = timing_info.firstTimeDatetime;
timingInfo.startOfExp.toFirstLidar = timing_info.lidar(1);

timingInfo.testDuration = timing_info.testDuration;

timingInfo.endExp.unix = timing_info.lastTimeUnix;
timingInfo.endExp.datetime = timing_info.lastTimeDatetime;
timingInfo.endExp.lastLidarTo = timing_info.testDuration - timing_info.lidar(end);

timingInfo.imageTimes = timing_info.lidar - timing_info.lidar(1);
timingInfo.numImages = length(timing_info.lidar);
timingInfo.frequency = 1/mean(diff(timing_info.lidar));

save(new_folder + "New Timing Info.mat", "timingInfo")

% Compare old folder to new folder
oldFolderStats.numVisible = length(imagery_data.visible);
oldFolderStats.visibleFreq = 1/mean(diff(timing_info.visible));

oldFolderStats.numInfrared = length(imagery_data.infrared);
oldFolderStats.infraredFreq = 1/mean(diff(timing_info.infrared));

save(new_folder + "Old Folder Stats.mat", "oldFolderStats")

%% Interpolate first, then last, then ... images
orderInterp = zeros(1, timingInfo.numImages);

firstCouple = 1:floor(timingInfo.numImages/10):timingInfo.numImages;
if firstCouple(end) ~= timingInfo.numImages
    firstCouple(end + 1) = timingInfo.numImages;
end
orderInterp(1:length(firstCouple)) = firstCouple;

others = 1:timingInfo.numImages;

orderInterp(length(firstCouple)+1:end) = setdiff(1:timingInfo.numImages, firstCouple);
%%
startImage = 1663; % Hardcode this
correspondingIndex = find(orderInterp == startImage, 1, "first");

startTime = tic();

index = correspondingIndex;
while index <= length(timing_info.lidar)
%for index = correspondingIndex:length(timing_info.lidar)
    try
        numLidarImage = orderInterp(index);
        disp("Interpolating image " + numLidarImage + " of " + length(timing_info.lidar))
        lidar_time = timing_info.lidar(numLidarImage);
    
        % Get relevant indexes for closest before/after images (visible + IR)
        vis_beforeIndex = find(timing_info.visible < lidar_time, 1, "last");
        vis_afterIndex = find(timing_info.visible > lidar_time, 1, "first");
    
        ir_beforeIndex = find(timing_info.infrared < lidar_time, 1, "last");
        ir_afterIndex = find(timing_info.infrared > lidar_time, 1, "first");
    
        if isempty(ir_beforeIndex) || isempty(ir_afterIndex) || isempty(vis_afterIndex) || isempty(vis_beforeIndex)
            disp("No 'before' and 'after' pair, skipping this image...")
            index = index + 1;
            disp(newline)
            continue
        end
    
        % Load in images
        vis_before = imread(imagery_data.visible(vis_beforeIndex));
        vis_after = imread(imagery_data.visible(vis_afterIndex));
    
        ir_before = read(Tiff(imagery_data.infrared(ir_beforeIndex)));
        ir_after = read(Tiff(imagery_data.infrared(ir_afterIndex)));
    
        % Get interpolated image data (the rgb / greyscale values)
        % Weight is in-between 0 and 1 (0 is before image, 1 is after image)
        vis_weight = (lidar_time - timing_info.visible(vis_beforeIndex)) / ...
                            diff(timing_info.visible([vis_beforeIndex vis_afterIndex]));
        ir_weight = (lidar_time - timing_info.infrared(ir_beforeIndex)) / ...
                           diff(timing_info.infrared([ir_beforeIndex ir_afterIndex]));
    
        % Weight of 0 means interp = before, weight of 1 means interp = after
        vis_interp = vis_before + vis_weight*(vis_after - vis_before);
        ir_interp = ir_before + ir_weight*(ir_after - ir_before);
    
        % Write interpolated image (let's see how this goes...)
        vis_name = new_folder + "Visible" + numLidarImage + ".jpg";
        ir_name = new_folder + "Infrared" + numLidarImage + ".tiff";
    
        imwrite(vis_interp, vis_name)
        imwrite(ir_interp, ir_name)
    
        % Add lidar file to folder, but renamed
        lidar_name = new_folder + "Lidar" + numLidarImage + ".csv";
        copyfile(original_folder + imagery_data.lidar_csvs(numLidarImage), lidar_name)
    
        disp("Image " + numLidarImage + " successfully interpolated.")
    
        estTotalTime = toc(startTime) / (index - correspondingIndex + 1) * (length(timing_info.lidar) - correspondingIndex + 1);
        timeElapsed = toc(startTime);
        fprintf("Images remaining: %g\n", length(timing_info.lidar) - index)
        fprintf("Estimated remaining time: %.2f sec\n\n", (estTotalTime - timeElapsed))
        index = index + 1;
    catch
        disp("Got an error somewhere! Waiting 30 seconds before rerunning...")
        pause(30)
        disp(newline)
    end

end

%%
%{
% Sanity check -- view the images
figure
imshow(vis_before)
title("Visible Before")

figure
imshow(vis_after)
title("Visible After")

figure
imshow(vis_interp)
title("Visible Interpolated")

figure
imshow(ir_before)
title("Infrared Before")

figure
imshow(ir_after)
title("Infrared After")

figure
imshow(ir_interp)
title("Infrared Interpolated")
%}