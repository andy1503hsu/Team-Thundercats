% Add time-corresponding transmissometer and Malvern data to the table
function imageryData = getTMData(imageryData)

    disp("Getting time-corresponding transmissometer and Malvern data...")

    % Get test day (May 11, 12, 13, or 14 2021)
    [~, ~, day] = ymd(imageryData.imageDatetime(1));

    % Sanity check -- https://workshops.larc.nasa.gov/RAM_Fog_Test/
    % May 11 -- baseline01 to fog06
    % May 12 -- baseline05 to fog15
    % May 13 -- baseline07 to fog18
    % May 14 -- baseline10 to fog24

    % Load in:
    % liquid water content (LWC), provided in g/m^3
    % Meteorological optical range (MOR) of the 532 nm beam, provided in m
    % Mean volumetric diameter (MeanVD), provided in microns
    % Median volumetric diameter (MedianVD), provided in microns

    if ~isempty(day == [11 12 13 14])
        load("Glenn I Data\fog_chamber_environment_\fog_chamber_environment_\fog_properties_202105" + day + ".mat", ...
             'LWC', 'MOR532', 'numberDisNorm', 'diameters', 'time')
        load("Glenn I Data\fog_chamber_environment_\fog_chamber_environment_\NASA_Malvern\NASA_202105" + day + "_RawOutput.mat", 'data1')
    else
        disp("Invalid day of testing. Code terminated.")
        return
    end

    % Seconds past midnight of test day when data was collected
    time_first3 = time;             % Time for LWC, mor532, and meanVD
    LWC = LWC;                      % LWC does not need to be modified
    mor532 = MOR532(:, 1);          % First column out of 4-column matrix
    meanVD = sum(diameters .* numberDisNorm, 2);

    time_medianVD = data1(:, 1); % Time for medianVD
    medianVD = data1(:, 3);

    % Seconds past midnight of test day when the image was taken
    imageSeconds = hour(imageryData.imageDatetime)*60*60 + ...
                   minute(imageryData.imageDatetime)*60 + ...
                   second(imageryData.imageDatetime);  % Includes milliseconds

    LWC_interpolated = interpolateData(time_first3, LWC, imageSeconds);
    mor532_interpolated = interpolateData(time_first3, mor532, imageSeconds);
    meanVD_interpolated = interpolateData(time_first3, meanVD, imageSeconds);
    medianVD_interpolated = interpolateData(time_first3, medianVD, imageSeconds);

    imageryData.mor532_meter = mor532_interpolated;
    imageryData.meanVD_microns = meanVD_interpolated;
    
    % Might be investigated later on
    imageryData.LWC_gramPerMeter3 = LWC_interpolated;
    imageryData.medianVD_microns = medianVD_interpolated;

    disp("Successful -- See imageryData for updated table.")
end

%% Interpolate transmissometer/Malvern data to match timing of images

% time1 and data combined create a time-series of discrete data points
% time2 are the time values that we want data points for
function interpolatedData = interpolateData(time1, data, time2)
    interpolatedData = zeros(length(time2), 1);
    for i = 1:length(time2)
        indexBefore = find(time2(i) > time1, 1, "last");
        indexAfter = find(time2(i) < time1, 1, "first");

        if isempty(indexBefore) || isempty(indexAfter)
            interpolatedData(i) = NaN;
            continue
        end

        dataBefore = data(indexBefore);
        dataAfter = data(indexAfter);

        if isempty(dataBefore) || isempty(dataAfter)
            interpolatedData(i) = NaN;
            continue
        end

        dataDiff = dataAfter - dataBefore;
        
        timeBefore = time1(indexBefore);
        timeAfter = time1(indexAfter);
        weight = (time2(i) - timeBefore) / (timeAfter - timeBefore);

        interpolatedData(i) = dataBefore + dataDiff * weight;
    end
end