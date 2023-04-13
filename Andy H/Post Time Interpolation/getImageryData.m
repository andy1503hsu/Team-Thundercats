function [imagery_data, other] = getImageryData(experimentName)
    tic;
    fprintf("%40s %-10s\n", "Finding data for:", experimentName)

    interpolatedFolder = "Post-Time Interpolation Data";
    path = "Glenn I Data\" + interpolatedFolder + "\" +  experimentName + "_condensed";
    addpath(genpath(path))
    files = dir(path);

    if isempty(files)
        disp("No experiment corresponds to this folder. Code terminated.")
        disp("Make sure this experiment has been time interpolated before using the getImageryData.m function.")
        return
    end
    
    % We got something!
    other.experimentName = experimentName;
    other.path = path;
    disp("Experiment found!")

    % Extract names of files and store into struct
    files = string(extractfield(files, "name"))';
    files(files == "." | files == "..") = [];  % Eliminate "." (refers to itself) and ".." (parent folder)
    files(files == "test_copyfile.csv") = [];  % Ignore this .csv
    files(files == "test_copyfile.tiff") = [];  % Ignore this .tiff
    files(files == "LidarDepthDist.csv") = [];  % Ignore this .csv

    % Time interpolation ensures first and last index of all three types of
    % images are the same
    [visibleBitMaps, ~, ~] = sortImageNames(files(endsWith(files, ".bmp") & startsWith(files, "Visible")));
    [infrared, ~, ~] = sortImageNames(files(endsWith(files, ".tiff") & startsWith(files, "Infrared")));
    [lidarDepthMap, firstIndex, lastIndex] = sortImageNames(files(endsWith(files, ".csv") & startsWith(files, "Lidar")));

    indexes = firstIndex:lastIndex;
    other.imageNumbers = indexes;

    % Make table that displays name and capture time of photos
    
    % Get start time of experiment from NASA documentation
    % Use this to adjust start time extracted from image names, in case
    % there is a time zone discrepancy

    [startDatetime_NASA, len] = getStartTime(experimentName);
    other.startOfExp.fromNASA = startDatetime_NASA;
    other.expDuration.fromNASA = len;

    % Get image capture times, with t=0 being the time of the very first
    % "original" image capture (i.e. non-interpolated) in the data folder, 
    % regardless of whether that was visible, infrared, or lidar. It is
    % unknown whether NASA determined their start of experiment datetimes
    % using a similar method.
    load(path + "\New Timing Info.mat", "timingInfo")  % Load in info
    startDatetime_Images = timingInfo.startOfExp.datetime;
    timeSinceStart = timingInfo.imageTimes(indexes);

    % Potentially adjust startDatetime2 to ensure we are in the correct
    % hour due to mismatching timezones of visible/infrared, lidar, and
    % transmissometer/Malvern
    hour_diff = diff(hour([startDatetime_Images, startDatetime_NASA]));

    % Positive hour_diff means startDatetime1 is later than startDatetime2
    startDatetime_Images = startDatetime_Images + duration(hour_diff, 0, 0);

    other.startOfExp.firstImage = startDatetime_Images;
    other.expDuration.firstToLastImage = timingInfo.endExp.datetime - ...
                                         timingInfo.startOfExp.datetime;

    %imageDatetime_NASA = startDatetime1 + seconds(imageCaptureTimes);
    imageDatetime = startDatetime_Images + seconds(timeSinceStart);
    imagery_data = table(imageDatetime, timeSinceStart, visibleBitMaps, infrared, lidarDepthMap);

    disp("Image names and corresponding datetimes put into imageryData.")
    fprintf("\n%40s %-10d\n", "Number of images per camera:", length(visibleBitMaps))
    fprintf("%40s %-.3f Hz\n\n", "Frequency of Time-Interpolated Images:", 1/mean(diff(timeSinceStart)))
end

%% Sort image names
% This is to ensure that the imagery_data arrays go in numerical order
% ("Visible1", "Visible2", "Visible3", etc.), instead of the default order
% which is lexicographic ("Visible1", "Visible10", "Visible11", etc.)

% Function assumes that the image names are "<word><number>"
function [sortedNames, firstIndex, lastIndex] = sortImageNames(unsortedNames)
    imageIndex = double(string(regexp(unsortedNames, "\d*", "match")));  % Casting directly with double doesn't work
    [~, order] = sort(imageIndex);
    sortedNames = unsortedNames(order);

    firstIndex = imageIndex(order(1));
    lastIndex = imageIndex(order(end));
end

%% Get the start of experiment time

% These times are directly from the NASA documentation (not inferred
% through the image capture times within the provided datasets)
function [startDatetime, length] = getStartTime(experimentName)
    load("Start of Experiments Info.mat", "combined")
    
    rowNum = combined.TestName == experimentName;
    startDatetime = combined.StartDatetime(rowNum);
    length = duration(combined.Hours(rowNum), ...
                      combined.Minutes(rowNum), ...
                      combined.Seconds(rowNum),...
                      combined.Milliseconds(rowNum));
end