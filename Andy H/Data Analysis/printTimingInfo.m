function printTimingInfo(timing_info, experimentName, details)
    disp("Timing info for " + experimentName + ": ")
    fprintf("%25s %20.3f %-5s\n", "Test Duration:", timing_info.testDuration, "secs")
    fprintf("%25s %25s\n", "Start Datetime:", string(timing_info.firstTimeDatetime))
    fprintf("%25s %25s\n", "End Datetime:", string(timing_info.lastTimeDatetime))
    
    fprintf("\n%25s\n", "Sampling rates:")
    
    fprintf("%25s %15.3f %2s\n", "Visible:", timing_info.visible_freq, "Hz")
    fprintf("%25s %15.3f %2s\n", "Infrared:", timing_info.infrared_freq, "Hz")
    fprintf("%25s %15.3f %2s\n", "Lidar:", timing_info.lidar_freq, "Hz")
    fprintf("%25s %15.3f %2s\n", "Trans/Malvern:", timing_info.transMalvern_freq, "Hz")

    if details == "on"
        visible_first = toDatetime(timing_info.firstTimeUnix + timing_info.visible(1));
        infrared_first = toDatetime(timing_info.firstTimeUnix + timing_info.infrared(1));
        lidar_first = toDatetime(timing_info.firstTimeUnix + timing_info.lidar(1));

        visible_last = toDatetime(timing_info.firstTimeUnix + timing_info.visible(end));
        infrared_last = toDatetime(timing_info.firstTimeUnix + timing_info.infrared(end));
        lidar_last = toDatetime(timing_info.firstTimeUnix + timing_info.lidar(end));
    
        disp(newline + "First and Last Time For Each Camera:")
        fprintf("%25s %25s\n", "Visible Start:", string(visible_first))
        fprintf("%25s %25s\n\n", "Visible End:", string(visible_last))
        fprintf("%25s %25s\n", "Infrared Start:", string(infrared_first))
        fprintf("%25s %25s\n\n", "Infrared End:", string(infrared_last))
        fprintf("%25s %25s\n", "Lidar Start:", string(lidar_first))
        fprintf("%25s %25s\n", "Lidar End:", string(lidar_last))
    end
    disp(newline)
end

function dateTime = toDatetime(time)
    dateTime = datetime(time, "ConvertFrom", "posixtime");
end