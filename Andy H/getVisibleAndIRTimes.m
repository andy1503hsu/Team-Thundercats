function [visible_times, infrared_times] = getVisibleAndIRTimes(imagery_data)

    [first_time_visible, times_zeroed_visible] = helperFunction(imagery_data.visible);
    [first_time_infrared, times_zeroed_infrared] = helperFunction(imagery_data.infrared);

    if first_time_visible > first_time_infrared % First recording was IR
        difference = first_time_visible - first_time_infrared;
        times_zeroed_visible = times_zeroed_visible + difference;

    else % First recording was visible
        difference = first_time_infrared - first_time_visible;
        times_zeroed_infrared = timed_zeroed_infrared + difference;
    end

    visible_times = times_zeroed_visible;
    infrared_times = times_zeroed_infrared;
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