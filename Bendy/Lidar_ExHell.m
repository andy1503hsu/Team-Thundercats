clc; clear; close all; 

% inputs
framepath = 'C:\Users\benrd\Box\Glenn I Data\Fog Data\fog01\fog01\Lidar';
filetype = 'pntcloud'; %set either to 'image' or 'pntcloud' not set up for boson or img yet
csvname = append('*',filetype,'*.csv');
len = 10; % !!!(set = 0 if you want all files to be read)!! [specifies how many files from the start to read
range = 'C:E'; %Set the range of columns you want in terms of excel lettering et. D:D gives just D
               % D:E gives both D & E %message ben if you want a weird
               % range, but you might just have to remove cols u don't want
               % afterward



pwd;
currentFolder = pwd; %saves name of current filepath

cd(framepath) %switches to data folder
info = dir(csvname); %extracts csv names

cd(currentFolder) %moves back to code folder
addpath(framepath) %adds files to path so they can be read


name = struct2cell(info);  %converts struct into cell
name = string(name(1,:)'); %gets file names into a string array

n = 0;

%loop extracts the frame numbers (matlab extracts the files unsorted)
for i = 1:length(name)
    nums(i) = extractBetween(name(i),'pntcloud_frame_', '_time');
    n = n + 1;
end

ind = str2double(nums)'+1; %turns the frame numbers into indecies to be called

%sorts frames from 0 -> n
name = name';
for i = 1:length(name)
    name_sort(ind(i)) = name(i);
end

%% 

if len == 0
    len = length(name);
end
C = {};
for i = 1:len
    in_temp = 0;
    opts = detectImportOptions(name_sort(i),'Range',range);  %still have to specify the full range
%     opts.SelectedVariableNames = opts.SelectedVariableNames([1 2]);
%     %can turn on to ignore cols
    C = [C; table2array(readtable(name_sort(i), opts))];
    clc;
    fprintf('%f percent files read', (i/length(name))*100)
end

%%
% save('intense.mat', 'intensity');
load('intense.mat');
sec_cycle = 1.3^-1;
a = 0:sec_cycle:(length(intensity)-1)*sec_cycle;


fog01_startidx = 3938;
fog01_endidx = 5435;
addpath('C:\Users\benrd\OneDrive - The University of Texas at Austin\Desktop\Senior-Design-Shenanigans\sriram\src')
fog_data = load("C:\Users\benrd\OneDrive - The University of Texas at Austin\Desktop\Senior-Design-Shenanigans\sriram\src\files/fog_properties_20210511.mat");
fog_data.time = fog_data.time(fog01_startidx:fog01_endidx) - fog_data.time(fog01_startidx);
fog_data.LWC = fog_data.LWC(fog01_startidx:fog01_endidx);
fog_data.extinction = fog_data.extinction(fog01_startidx:fog01_endidx);
mor_vis = fog_data.MOR532(:, 1);
mor_vis = mor_vis(fog01_startidx:fog01_endidx);
%%
figure;
hold on;
yyaxis left
plot(a(1,1:end-22), intensity(1,1:end-22))
xlabel('time (s)')
ylabel('intensity (w/m^2)')
yyaxis right
plot(fog_data.time, mor_vis)
ylabel('MOR532 (meters)')
title("Intensity (Left) & Meterological Optical Range (Right) vs Time")
hold off;

y = sgolayfilt(intensity',3,71);
more_visFlt = sgolayfilt(mor_vis,3,71);
lwc = sgolayfilt(fog_data.LWC,3,71);

figure;
yyaxis left
plot(a(1,1:end-22), y(1:end-22,1))
xlabel('time (s)')
ylabel('intensity (w/m^2)')

yyaxis right
plot(fog_data.time, more_visFlt)
ylabel('MOR532 (meters)')
title("[Filtered] Intensity (Left) & Meterological Optical Range (Right) vs Time")
hold off;


%%
figure;
hold on;
yyaxis left
plot(a(1,1:end-22), intensity(1,1:end-22))
xlabel('time (s)')
ylabel('intensity (w/m^2)')
yyaxis right
plot(fog_data.time, fog_data.LWC)
ylabel('LWC (g/m^3)')
title("Intensity (Left) & Liquid Water Content (Right) vs Time")
hold off;

% corrcoef(fog_data.LWC, intensity(1,1:end-22))


%cross correlation

% figure;
% [c,lags] = xcorr(intensity(1,1:end-22), fog_data.LWC);
% stem(lags,c)





%filtered graph


figure;
yyaxis left
plot(a(1,1:end-22), y(1:end-22,1))
xlabel('time (s)')
ylabel('intensity (w/m^2)')

yyaxis right
plot(fog_data.time, lwc)
ylabel('LWC (g/m^3)')
title("[Filtered] Intensity (Left) & Liquid Water Content (Right) vs Time")
hold off;
%%
%flux graph
flux = diff(y)/sec_cycle; 


figure;
plot(a(1,1:end-31), flux(1:end-30,1))
xlabel('time (s)')
ylabel('flux (w/m^2*s)')
title('Flux (From filtered Intensity Spectrum)')




    