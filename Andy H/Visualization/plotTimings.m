function plotTimings(timing_info, experimentName)
    figure
    hold on
    grid on
    
    plot(timing_info.visible, ones(size(timing_info.visible)), ".")
    plot(timing_info.infrared, 1.01*ones(size(timing_info.infrared)), ".")
    plot(timing_info.lidar, 1.02*ones(size(timing_info.lidar)), ".")
    %plot(timing_info.transMalvern, 1.03*ones(size(timing_info.transMalvern)), ".")

    title("Sampling Times of " + experimentName)
    xlabel("Time Since First Image (sec)")
    
    yticks([1 1.01 1.02 1.03])
    yticklabels({'Visible', "Infrared", "Lidar", "Trans/Malvern"})

    yticks([1 1.01 1.02])
    yticklabels({'Visible', "Infrared", "Lidar"})
    ylim([0.98, 1.05])
end