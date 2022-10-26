%% By camera -- visible, IR, Lidar

function image_timings = getCameraTimings(imagery_data)
    [first_time_visible, times_zeroed_visible] = helperFunction(imagery_data.visible);
    [first_time_infrared, times_zeroed_infrared] = helperFunction(imagery_data.infrared);
    [first_time_lidar, times_zeroed_lidar] = getLidarTimes(imagery_data);

    first_time_visible = first_time_visible - 6*60*60; % 6 hours ahead of trans/malvern data (the actually accurate one)
    first_time_infrared = first_time_infrared - 6*60*60; % 6 hours ahead of trans/malvern data (the actually accurate one)
    first_time_lidar = first_time_lidar + 60*60; % 1 hour behind of trans/malvern data (the actually accurate one)

    minTimes = [first_time_visible, first_time_infrared, first_time_lidar];
    
    %{
    datetime(first_time_visible, "ConvertFrom", "posixtime")
    datetime(first_time_infrared, "ConvertFrom", "posixtime")
    datetime(first_time_lidar, "ConvertFrom", "posixtime")
    %}

    
    %{
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

    image_timings.visible = sort(times_zeroed_visible);
    image_timings.infrared = sort(times_zeroed_infrared);
    image_timings.lidar = sort(times_zeroed_lidar);

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

%% For IR / visible images -- first 10 digits are seconds, rest are nanoseconds

function [first_time, times_zeroed] = helperFunction(string_names)
    time_text = string(regexp(string_names, "\d*", "match"));
    seconds = str2double(extractBetween(time_text, 1, 10));
    nanoseconds = str2double(extractBetween(time_text, 11, strlength(time_text)));

    first_second = seconds(1);
    first_nanosecond = nanoseconds(1);
    first_time = first_second + first_nanosecond/1e9;    

    times_zeroed = seconds + nanoseconds/1e9 - first_time;
end

function [first_time, times_zeroed] = getLidarTimes(imagery_data)
    all_numbers = str2double(cell2string(regexp(imagery_data.lidar_csvs, "\d*", "match")));
    [~, order] = sort(all_numbers(:, 1));
    all_numbers = all_numbers(order, :);
    % Naming convention of the Lidar file dictates 8 separate numbers
    % 1st: Frame #
    % 2-4: Year, Month, Day
    % 5-6th: Hour, Minute
    % 7-8th: Second, Millisecond (not nanosecond!)

    % This function assumes that the year/month/day is constant per one
    % experiment (I highly doubt they ran tests overnight). In other words,
    % only numbers 1, 5, 6, 7, and 8 change.

    % Furthermore, the frame number is rather relevant for timing. So only
    % 5-8 will be looked at.

    hour = all_numbers(:, 5);
    minute = all_numbers(:, 6);
    second = all_numbers(:, 7);
    millisecond = all_numbers(:, 8);

    times = hour*60*60 + minute*60 + second + millisecond/1e3;

    ft = all_numbers(1, 2:end);  % 1 x 7 double array with the first entry
    first_time = datetime(ft(1), ft(2), ft(3), ft(4), ft(5), ft(6), ft(7));  % datetime
    first_time = posixtime(first_time);  % Unix time (what we want)
    times_zeroed = times - times(1);
end

%% MATLAB output from regexp() is annoying
function stringMatrix = cell2string(cellMatrix)
    first_entry = cellMatrix(1);
    first_entry = first_entry{1};

    stringMatrix = strings(length(cellMatrix), length(first_entry));

    for i = 1:length(cellMatrix)
        entry = cellMatrix(i);
        entry = entry{1};
        stringMatrix(i, :) = entry;
    end
end