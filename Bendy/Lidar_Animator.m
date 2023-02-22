clc; clear; close all;

framepath = 'C:\Users\benrd\Box\Glenn I Data\Fog Data\fog01\fog01\Lidar';
filetype = 'pntcloud'; %set either to 'image' or 'pntcloud' not set up for boson or img yet
len = 225; % !!!(set = 0 if you want all files to be read)!! [specifies how many files from the start to read
range = 'C:E';


[C] = extract_values(framepath, filetype, len, range);
%%
save('fog01_xyz.mat', 'C');
%%
load('fog01_xyz.mat')
figure;
az = 0;
    colorbar
    colormap("winter")

    
figure(1)
filename = 'testnew51.gif';
for i = 1:length(C)
    plot_temp = cell2mat(C(i)); %temporarily stores the point cloud for animation
    az = az -5;
    x = plot_temp(:,1);
    y = plot_temp(:,2);
    z = plot_temp(:,3);
    pcshow([x(:) y(:) z(:)])
    colorbar
    colormap("winter")
    xlabel('X')
    ylabel('Y')
    zlabel('Z')
    axis([0 4 -1.5 1.5 0 3])
    if az < -180
        az = 180;
    end
    view([az 30]) %changes view point
      %writes figure to a gif
      drawnow
      frame = getframe(1);
      im = frame2im(frame);
      [imind,cm] = rgb2ind(im,256);
      if i == 1
          imwrite(imind,cm,filename,'gif', 'Loopcount',inf);
      else
          imwrite(imind,cm,filename,'gif','WriteMode','append');
      end
    pause(.001)

end


