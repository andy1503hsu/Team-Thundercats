clear
clc
close all

%% What experiment to look at?
type = "baseline";              % "baseline" or "fog"
experimentName = "baseline01";   % "baseline01", "baseline02", "fog01", etc.

%% Get imagery (visible, IR, lidar) and instrument (trans/Malvern) data and timings
imagery_data = findImageNames(type, experimentName);
[imagery_data, timing_info] = getCameraTimings(imagery_data);

%[instrument_data, timing_info] = getInstrumentData(experimentName, timing_info);

% Sampling frequencies
%timing_info = getSamplingFrequencies(timing_info, experimentName);

%% Display Stuff
%printTimingInfo(timing_info, experimentName, "off");
%%
plotTimings(timing_info, experimentName);
