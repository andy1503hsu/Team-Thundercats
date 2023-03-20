clear
clc
close all
%% Crop visible images to ensure visible and infrared have same size

%% What experiment to look at?
experimentName = "fog16";   % "baseline01", "baseline02", "fog01", etc.
folder = "Glenn I Data\Post-Time Interpolation Data\" + experimentName + "_condensed\";

%% Get through all visible images

files = dir(folder);
files = string(extractfield(files, "name"))';
visibleImages = files(endsWith(files, ".jpg"));
infraredImages = files(endsWith(files, ".tiff"));
%%

visibleTest = imread(folder + visibleImages(1));
infraredTest = imread(folder + infraredImages(1));