function [first_time, times_zeroed] = getLidarTimes(imagery_data)
    all_numbers = str2double(cell2string(regexp(imagery_data.lidar_csvs, "\d*", "match")));

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

    first_time = times(1);
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