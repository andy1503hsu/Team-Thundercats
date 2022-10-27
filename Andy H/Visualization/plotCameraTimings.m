function plotCameraTimings(image_timings, experimentName)
    figure
    hold on
    grid on
    
    plot(image_timings.visible, ones(size(image_timings.visible)), ".")
    plot(image_timings.infrared, 1.01*ones(size(image_timings.infrared)), ".")
    plot(image_timings.lidar, 1.02*ones(size(image_timings.lidar)), ".")
    
    title("Imaging Times of " + experimentName)
    xlabel("Time Since Start of Experiment (sec)")
    
    yticks([1 1.01 1.02])
    yticklabels({'Visible', "Infrared", "Lidar"})
    ylim([0.99, 1.03])
end