clear
clc
close all
%% Test getImageryData.m
clc
experimentName = "baseline08";  % Change this line to "fog16", "baseline01", etc.
[imageryData, other] = getImageryData(experimentName);

%% Get Transmissometer and Malvern Data
imageryData = getTMData(imageryData);