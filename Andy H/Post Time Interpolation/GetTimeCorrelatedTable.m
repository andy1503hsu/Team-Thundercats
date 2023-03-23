clear
clc
close all
%% Test getImageryData.m
clc
experimentName = "fog16";  % Change this line to "fog16", "baseline01", etc.
[imageryData, other] = getImageryData(experimentName);

%% Get Transmissometer and Malvern Data
imageryData = getTMData(imageryData);

%{
%% Figure out some things
load('Glenn I Data\fog_chamber_environment_\fog_chamber_environment_\fog_properties_20210511.mat')
%%
figure
hold on
set(gca, 'YScale', 'log')
grid on
plot(time/60, MOR532, ".")

xlabel("Minutes")
ylabel("MOR532 file")

% First column of MOR532 file (there are 4 files) corresponds to MOR532.fig
% plot

% As for the other three, I am unsure

%%
% diameters that I assume are used for median volumetric diameter

meanDiam = sum(diameters .* numberDisNorm, 2);

figure
hold on
set(gca, 'YScale', 'log')
grid on
plot(time/60, meanDiam, ".")

xlabel("Minutes")
ylabel("Mean diameter maybe?")
ylim([0, 1e1])

% Line 32 is how meanDiam figures were produced
% Diameter is in MICRONS
%
%plot(data1(:, 1)/60, data1(:, 3), ".")
legend(["Mean VD", "Median VD"])

%{
% Compare mean and median
cdf = cumsum(numberDisNorm, 2);
perc50_1 = zeros(length(cdf), 1);
perc50_2 = zeros(length(cdf), 1);

for row = 1:length(cdf)
    
    % Perc50_1 -- Assume "bar chart" distribution of diameters,
    % For example, if diameters(1:2) is [0.1, 0.2], and cdf(row, 1:2) =
    % [0.45 0.55], then the median (cdf of 50%) would be a diameter of
    % 0.15.
    col = find(cdf(row, :) > 0.5, 1, "first");
    if isempty(col)
        perc50_1(row) = NaN;
    else
        if col == 1
            perc50_1(row) = diameters(1);
            continue
        end
        beforeCdf = cdf(row, col - 1);
        pdfBin = cdf(row, col) - beforeCdf;

        beforeDiam = diameters(col - 1);
        diamDiff = diff(diameters([col-1 col]));
        weight = (0.5 - beforeCdf) / pdfBin;

        interpDiam = beforeDiam +  weight * diamDiff;
        perc50_1(row) = interpDiam;

    end


end

plot((time - time(1))/60, perc50_1, ".")
plot((time - time(1))/60, perc50_1, ".")


legend(["Mean Volumetric Diameter", "Median Volumetric Diameter"])
%}
%}