%% Get and return sampling frequencies from image capture times
function timing_info = getSamplingFrequencies(timing_info, experimentName)
    visible_freq = 1/mean(diff(timing_info.visible));
    infrared_freq = 1/mean(diff(timing_info.infrared));
    lidar_freq = 1/mean(diff(timing_info.lidar));
    transMalvern_freq = 1/mean(diff(timing_info.transMalvern));
    
    visible_std = std(diff(timing_info.visible));
    infrared_std = std(diff(timing_info.infrared));
    lidar_std = std(diff(timing_info.lidar));
    transMalvern_std = std(diff(transMalvern_freq));
    
    timing_info.visible_freq = visible_freq;
    timing_info.infrared_freq = infrared_freq;
    timing_info.lidar_freq = lidar_freq;
    timing_info.transMalvern_freq = transMalvern_freq;

    %{
    disp(newline + "Sampling rate of cameras for " + experimentName + ":")
    
    fprintf("%25s%-20s%-20s%-20s\n", "", "Avg secs/image", "Std Dev", "Hz")
    fprintf("%10s%-15s%-20.6f%-20.6f%-20.6f\n", "", "Visible:", 1/visible_freq, visible_std, visible_freq)
    fprintf("%10s%-15s%-20.6f%-20.6f%-20.6f\n", "", "Infrared:", 1/infrared_freq, infrared_std, infrared_freq)
    fprintf("%10s%-15s%-20.6f%-20.6f%-20.6f\n", "", "Lidar:", 1/lidar_freq, lidar_std, lidar_freq)
    fprintf("%10s%-15s%-20.6f%-20.6f%-20.6f\n", "", "Trans/Malvern:", 1/transMalvern_freq, transMalvern_std, transMalvern_freq)
    %}
end