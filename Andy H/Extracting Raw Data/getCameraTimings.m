%% Get camera timings for visible, IR, and lidar
% Also sort the image names into time-ascending order (alphabetical order
% is NOT time-ascending order due to reasons I can explain later)

function [imagery_data, image_timings] = getCameraTimings(imagery_data)
    [first_time_visible, times_zeroed_visible, sorted_visible] = getVisibleAndIRTimes(imagery_data.visible);
    [first_time_infrared, times_zeroed_infrared, sorted_infrared] = getVisibleAndIRTimes(imagery_data.infrared);
    [first_time_lidar, times_zeroed_lidar, sorted_lidar_csvs] = getLidarTimes(imagery_data.lidar_csvs);

    imagery_data.visible = sorted_visible;
    imagery_data.infrared = sorted_infrared;
    imagery_data.lidar_csvs = sorted_lidar_csvs;

    first_time_visible = first_time_visible - 6*60*60; % 6 hours ahead of trans/malvern data (the actually accurate one)
    first_time_infrared = first_time_infrared - 6*60*60; % 6 hours ahead of trans/malvern data (the actually accurate one)
    first_time_lidar = first_time_lidar + 60*60; % 1 hour behind of trans/malvern data (the actually accurate one)

    minTimes = [first_time_visible, first_time_infrared, first_time_lidar];
    
    %{
    datetime(first_time_visible, "ConvertFrom", "posixtime")
    datetime(first_time_infrared, "ConvertFrom", "posixtime")
    datetime(first_time_lidar, "ConvertFrom", "posixtime")

    datetime(first_time_visible + times_zeroed_visible(end), "ConvertFrom", "posixtime")
    datetime(first_time_infrared + times_zeroed_infrared(end), "ConvertFrom", "posixtime")
    datetime(first_time_lidar + times_zeroed_lidar(end), "ConvertFrom", "posixtime")
    %}
    [~, minIndex] = min(minTimes);
    
    if minIndex == 1  % Visible was first
        times_zeroed_infrared = times_zeroed_infrared + (first_time_infrared - first_time_visible); 
        times_zeroed_lidar = times_zeroed_lidar + (first_time_lidar - first_time_visible);
        image_timings.firstTimeUnix = first_time_visible;
        image_timings.firstTimeDatetime = datetime(first_time_visible, "ConvertFrom", "posixtime");
        image_timings.firstCamera = "visible";

    elseif minIndex == 2 % Infrared was first
        times_zeroed_visible = times_zeroed_visible + (first_time_visible - first_time_infrared);
        times_zeroed_lidar = times_zeroed_lidar + (first_time_lidar - first_time_infrared);
        image_timings.firstTimeUnix = first_time_infrared;
        image_timings.firstTimeDatetime = datetime(first_time_infrared, "ConvertFrom", "posixtime");
        image_timings.firstCamera = "infrared";
        
    else  % Lidar was first
        times_zeroed_visible = times_zeroed_visible + (first_time_visible - first_time_lidar);
        times_zeroed_infrared = times_zeroed_infrared + (first_time_infrared - first_time_lidar);
        image_timings.firstTimeUnix = first_time_lidar;
        image_timings.firstTimeDatetime = datetime(first_time_lidar, "ConvertFrom", "posixtime");
        image_timings.firstCamera = "lidar";
        
    end

    % TIMES AREN'T SORTED because of stupid reasons but we'll just do it ourselves

    image_timings.visible = times_zeroed_visible;
    image_timings.infrared = times_zeroed_infrared;
    image_timings.lidar = times_zeroed_lidar;

    [max_time, index] = max([image_timings.visible(end) image_timings.infrared(end) image_timings.lidar(end)]);
    if index == 1  % Visible had last capture
        image_timings.lastCamera = "visible";
    elseif index == 2  % IR had last capture
        image_timings.lastCamera = "infrared";
    else  % Lidar had last capture
        image_timings.lastCamera = "lidar";
    end
    image_timings.lastTimeUnix = image_timings.firstTimeUnix + max_time;
    image_timings.lastTimeDatetime = datetime(image_timings.lastTimeUnix, "ConvertFrom", "posixtime");
    image_timings.testDuration = max_time;
end