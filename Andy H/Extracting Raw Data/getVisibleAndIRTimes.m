%% Get timing data for visible/IR pictures and sort file names
% Visible and IR data is stored the same way, so the same function can beused
% First 10 digits are seconds, rest are nanoseconds

function [first_time, times_zeroed, sorted_names] = getVisibleAndIRTimes(string_names)
    time_text = string(regexp(string_names, "\d*", "match"));
    seconds = str2double(extractBetween(time_text, 1, 10));
    nanoseconds = str2double(extractBetween(time_text, 11, strlength(time_text)));

    times = [seconds nanoseconds];
    [times, order] = sortrows(times);
    sorted_names = string_names(order);

    first_second = times(1,1);
    first_nanosecond = times(1,2);
    first_time = first_second + first_nanosecond/1e9;    

    times_zeroed = times(:, 1) + times(:, 2)/1e9 - first_time;
end