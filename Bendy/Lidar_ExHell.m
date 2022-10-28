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
sec_cycle = 1.03^-1;
a = 0:sec_cycle:(length(intensity)-1)*sec_cycle;
figure;

plot(a, intensity)
xlabel('time (s)')
ylabel('intensity (w/m^2)')



    