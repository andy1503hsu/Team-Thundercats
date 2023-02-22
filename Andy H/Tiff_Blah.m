clear
clc
close all

%% What experiment to look at?
type = "baseline";              % "baseline" or "fog"
experimentName = "baseline01";   % "baseline01", "baseline02", "fog01", etc.

%% Get imagery (visible, IR, lidar) and instrument (trans/Malvern) data and timings
imagery_data = findImageNames(type, experimentName);
[imagery_data, timing_info] = getCameraTimings(imagery_data);

[instrument_data, timing_info] = getInstrumentData(experimentName, timing_info);

% Sampling frequencies
timing_info = getSamplingFrequencies(timing_info, experimentName);

%% Display Stuff
printTimingInfo(timing_info, experimentName, "off");

%% Load in a .tiff file
tiff_file = Tiff(imagery_data.infrared(1))
tiff_file.getVersion

%% Number of image directories
% Default "IFD" is 1, and lastDirectory() outputs true
currentDirectory(tiff_file)
lastDirectory(tiff_file)

%% Details about the 1 IFD
tiff_info = imfinfo(imagery_data.infrared(1))

tiff_file.getTag("Photometric") % 1, which corresponds to MinIsBlack (grayscale)