function printCameraTimingInfo(image_timings, experimentName)
    disp("Timing info for " + experimentName + ": ")
    fprintf("%25s %20.3f %-5s\n", "Test Duration:", image_timings.testDuration, "secs")
    fprintf("%25s %25s\n", "Start Datetime:", string(image_timings.firstTimeDatetime))
    fprintf("%25s %25s\n", "End Datetime:", string(image_timings.lastTimeDatetime))
    
    fprintf("\n%25s\n", "Sampling rates:")
    
    fprintf("%25s %15.3f %2s\n", "Visible:", image_timings.visible_freq, "Hz")
    fprintf("%25s %15.3f %2s\n", "Infrared:", image_timings.infrared_freq, "Hz")
    fprintf("%25s %15.3f %2s\n", "Lidar:", image_timings.lidar_freq, "Hz")
end