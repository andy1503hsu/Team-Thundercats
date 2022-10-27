%% Get and return sampling frequencies from image capture times
function image_timings = getSamplingFrequencies(image_timings, experimentName)
    visible_freq = 1/mean(diff(image_timings.visible));
    infrared_freq = 1/mean(diff(image_timings.infrared));
    lidar_freq = 1/mean(diff(image_timings.lidar));
    
    visible_std = std(diff(image_timings.visible));
    infrared_std = std(diff(image_timings.infrared));
    lidar_std = std(diff(image_timings.lidar));
    
    image_timings.visible_freq = visible_freq;
    image_timings.infrared_freq = infrared_freq;
    image_timings.lidar_freq = lidar_freq;

    %{
    disp(newline + "Sampling rate of cameras for " + experimentName + ":")
    
    fprintf("%25s%-20s%-20s%-20s\n", "", "Avg secs/image", "Std Dev", "Hz")
    fprintf("%10s%-15s%-20.6f%-20.6f%-20.6f\n", "", "Visible:", 1/visible_freq, visible_std, visible_freq)
    fprintf("%10s%-15s%-20.6f%-20.6f%-20.6f\n", "", "Infrared:", 1/infrared_freq, infrared_std, infrared_freq)
    fprintf("%10s%-15s%-20.6f%-20.6f%-20.6f\n", "", "Lidar:", 1/lidar_freq, lidar_std, lidar_freq)
    %}
end