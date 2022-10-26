clear
%clc
close all
%%
addpath(genpath('Glenn I Data'))

%% What experiment to look at?
type = "fog";              % "baseline" or "fog"
experimentName = "fog01";   % "baseline01", "baseline02", "fog01", etc.

imagery_data = getImageryData(type, experimentName);
image_timings = getCameraTimings(imagery_data);

%% Plot?
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

%% Get sampling frequency
visible_freq = 1/mean(diff(image_timings.visible));
infrared_freq = 1/mean(diff(image_timings.infrared));
lidar_freq = 1/mean(diff(image_timings.lidar));

visible_std = std(diff(image_timings.visible));
infrared_std = std(diff(image_timings.infrared));
lidar_std = std(diff(image_timings.lidar));


disp(newline + "Sampling rate of cameras for " + experimentName + ":")

fprintf("%25s%-20s%-20s%-20s\n", "", "Avg secs/image", "Std Dev", "Hz")
fprintf("%10s%-15s%-20.6f%-20.6f%-20.6f\n", "", "Visible:", 1/visible_freq, visible_std, visible_freq)
fprintf("%10s%-15s%-20.6f%-20.6f%-20.6f\n", "", "Infrared:", 1/infrared_freq, infrared_std, infrared_freq)
fprintf("%10s%-15s%-20.6f%-20.6f%-20.6f\n", "", "Lidar:", 1/lidar_freq, lidar_std, lidar_freq)