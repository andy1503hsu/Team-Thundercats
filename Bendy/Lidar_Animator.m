clc; clear; close all;

framepath = 'C:\Users\benrd\Box\Glenn I Data\Fog Data\fog01\fog01\Lidar';
filetype = 'pntcloud'; %set either to 'image' or 'pntcloud' not set up for boson or img yet
len = 50; % !!!(set = 0 if you want all files to be read)!! [specifies how many files from the start to read
range = 'C:E';


[C] = extract_values(framepath, filetype, len, range);
%%
figure;
az = 0;
for i = 1:length(C)
    plot_temp = cell2mat(C(i)); %temporarily stores the point cloud for animation
    az = az -5;
    x = plot_temp(:,1);
    y = plot_temp(:,2);
    z = plot_temp(:,3);
    pcshow([x(:) y(:) z(:)])
    xlabel('X')
    ylabel('Y')
    zlabel('Z')
    axis([0 10 -1.5 1.5 0 3])
    if az < -180
        az = 180;
    end
    view([az 30])
    pause(.1)
end


