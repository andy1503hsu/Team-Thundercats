clear
clc
close all
%% Load in fog16 data and .mat files
load("fog16 table with some transmissometer and Malvern data.mat")

processed = load("fog_properties_20210513.mat");
rawMalvern = load("NASA_20210513_RawOutput.mat");

%% 
imageTimes = imageryData.imageDatetime;
imageTimes = getSeconds(imageTimes);

%% Look at processed data first
timeProcessed = processed.time;
LWC = processed.LWC;
mor532 = processed.MOR532(:, 1);

mor_Huh = processed.MOR532(:, 2:4);
meanVD = sum(processed.diameters .* processed.numberDisNorm, 2);

extinctCoeffs = processed.extinction;

Nd = processed.Nd;

% From Raw Malvern data
timeMalvern = rawMalvern.data1(:, 1);
medianVD = rawMalvern.data1(:, 3);
Cv = rawMalvern.data1(:, 4);
%% Interpolate processed data
LWC_interp = interpolateData(timeProcessed, LWC, imageTimes);
MOR_interp = interpolateData(timeProcessed, mor532, imageTimes);
meanVD_interp = interpolateData(timeProcessed, meanVD, imageTimes);
extinctCoeffs_interp = interpolateData(timeProcessed, extinctCoeffs, imageTimes);

MOR_huh_interp = interpolateData(timeProcessed, mor_Huh, imageTimes);

Nd_interp = interpolateData(timeProcessed, Nd, imageTimes);

medianVD_interp = interpolateData(timeMalvern, medianVD, imageTimes);
Cv_interp = interpolateData(timeMalvern, Cv, imageTimes);
%% Plot against MOR, since we know MOR is good
figure
hold on
grid on

plot(imageTimes - imageTimes(1), MOR_interp)
ylabel("Meterological Optical Range, MOR [m]")

xlabel("Seconds Since Start of Fog16")

yyaxis right
%plot(imageTimes - imageTimes(1), LWC_interp)
%ylabel("Liquid Water Content, LWC [g/m^3]")

%plot(imageTimes - imageTimes(1), meanVD_interp)
%ylabel("Mean Volumetric Diameter [microns]")

%plot(imageTimes - imageTimes(1), extinctCoeffs_interp, "LineWidth", 1.5)
%ylabel("Extinction Coefficients [unitless]")
%legend(["MOR", "Longwave Infrared (LWIR)", "Shortwave Infrared (SWIR)", "Visible (VIS)"], "Location", "southeast")

%plot(imageTimes - imageTimes(1), MOR_huh_interp, "LineWidth", 1.5)
%ylabel("The Other MOR Columns [meters?]")
%legend(["MOR", "MOR Column 2", "MOR Column 3", "MOR Column 4"], "Location", "southeast")

%plot(imageTimes - imageTimes(1), Nd_interp, "LineWidth", 1.5)
%ylabel("Number of Particles suspended?? [particles/cm^3]")
%legend(["MOR", "# Particles Column 1", "Column 2", "Column 3"], "Location", "southeast")

%plot(imageTimes - imageTimes(1), medianVD_interp, "LineWidth", 1.5)
%ylabel("Median Volumetric Diameter [microns]")

plot(imageTimes - imageTimes(1), Cv_interp, "LineWidth", 1.5)
ylabel("Cv (??) [%]")
%% Interpolate transmissometer/Malvern data to match timing of images

% time1 and data combined create a time-series of discrete data points
% time2 are the time values that we want data points for
function interpolatedData = interpolateData(time1, data, time2)
    interpolatedData = zeros(length(time2), size(data, 2));
    for i = 1:length(time2)
        indexBefore = find(time2(i) > time1, 1, "last");
        indexAfter = find(time2(i) < time1, 1, "first");

        if isempty(indexBefore) || isempty(indexAfter)
            interpolatedData(i) = NaN;
            continue
        end

        dataBefore = data(indexBefore, :);
        dataAfter = data(indexAfter, :);

        if isempty(dataBefore) || isempty(dataAfter)
            interpolatedData(i) = NaN;
            continue
        end

        dataDiff = dataAfter - dataBefore;
        
        timeBefore = time1(indexBefore);
        timeAfter = time1(indexAfter);
        weight = (time2(i) - timeBefore) / (timeAfter - timeBefore);

        interpolatedData(i, :) = dataBefore + dataDiff * weight;
    end
end

%% Get seconds past midnight from a datetime-format
function seconds = getSeconds(datetimeVariable)
    seconds = hour(datetimeVariable)*60*60 + ...
                   minute(datetimeVariable)*60 + ...
                   second(datetimeVariable);  % Includes milliseconds
end