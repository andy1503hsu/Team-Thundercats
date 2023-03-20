function [instrument_data, timing_info] = getInstrumentData(experimentName, timing_info)
    if ismember(experimentName, ["baseline0" + (1:4), "fog0" + (1:4)])
        fog_data = load("sriram/src/files/fog_properties_20210511.mat");
    end
    [hr, min, sec] = hms([timing_info.firstTimeDatetime; timing_info.lastTimeDatetime]);
    secondsRange = sum(hr.*3600 + min.*60 + sec, 2);
    binRange = discretize(secondsRange, fog_data.time);

    %binRange(1) = binRange(1); % "First" trans/Malvern reading is *after* first image, eliminates need to shift image timings
    % Not good in the grand scene of things but for now
    if any(isnan(binRange)) % No trans/Malvern data in this experiment
        timing_info.transMalvern = [];
        instrument_data = struct;
        return
    end
    binRange(2) = binRange(2) + 1; % So there is a trans/Malvern reading *after* the last image

    timing_info.transMalvern = fog_data.time(binRange(1):binRange(2)) - secondsRange(1);
    % transmission, MOR532, extinction, LWC, Nd, numberDisNorm -- 1 time entry per row

    instrument_data.transmission = fog_data.transmission(binRange(1):binRange(2), :);
    instrument_data.MOR532 = fog_data.MOR532(binRange(1):binRange(2), :);
    instrument_data.extinction = fog_data.extinction(binRange(1):binRange(2), :);
    instrument_data.LWC = fog_data.LWC(binRange(1):binRange(2), :);
    instrument_data.Nd = fog_data.Nd(binRange(1):binRange(2), :);
    instrument_data.numberDisNorm = fog_data.numberDisNorm(binRange(1):binRange(2), :);

    % Fields that are non-time dependent (will still "port over", might be useful)
    instrument_data.diameters = fog_data.diameters;
    instrument_data.datanum = fog_data.datenum;
    instrument_data.date = fog_data.date;
end