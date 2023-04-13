function imagery_data = findImageNames(type, experimentName)
    fprintf("%20s %-10s\n", "Looking at type:", type)
    fprintf("%20s %-10s\n\n", "Experiment name:", experimentName)
    
    if type == "baseline"
        path_to_images = "Glenn I Data\Baseline Data\" + experimentName + "\" + experimentName;
        addpath(genpath(path_to_images))
        folders = dir(path_to_images);
    elseif type == "fog"
        path_to_images = "Glenn I Data\Fog Data\" + experimentName + "\" + experimentName;
        addpath(genpath(path_to_images))
        folders = dir(path_to_images);
        if isempty(folders)  % Might be this one too
            path_to_images = "Glenn I Data\Fog Data\" + experimentName;
            addpath(genpath(path_to_images))
            folders = dir(path_to_images);
        end
    else
        disp("Invalid type. Code terminated.")
        return
    end
    
    imagery_data.path = path_to_images;
    
    if isempty(folders)
        disp("No experiment corresponds to this type/name match. Code terminated.")
        return
    else  % We got something!
        disp("Experiment found!")
        disp(newline + "In this folder, there are: ")
    
        files = dir(path_to_images + "\Database\*");
        files = string(extractfield(files, "name"))';
        files(files == "." | files == "..") = [];  % Eliminate "." (refers to itself) and ".." (parent folder)
        imagery_data.visible = files(endsWith(files, ".jpg"));
        imagery_data.infrared = files(endsWith(files, ".tiff"));
        imagery_data.metadata = files(endsWith(files, ".csv"));  % Only for visible and IR images
        imagery_data.visIR_other = files(~contains(files, [imagery_data.visible; ...
                                                           imagery_data.infrared; ...
                                                           imagery_data.metadata]));
    
        fprintf("%4s%-20s\n", "", "In the 'Database' subfolder (visible + infrared data)")
        fprintf("%10d %-30s\n", length(imagery_data.visible), "visible images (.jpg)")
        fprintf("%10d %-30s\n", length(imagery_data.infrared), "infrared images (.tiff)")
        fprintf("%10d %-30s\n", length(imagery_data.metadata), "metadata file (.csv)")
        fprintf("%10d %-30s\n", length(imagery_data.visIR_other), "other files")
        if ~isempty(imagery_data.visIR_other)
            for index = 1:length(imagery_data.visIR_other)
                fprintf("%12s %-30s\n", "", imagery_data.visIR_other(index))
            end
        end
        fprintf("\n")


        files = dir(path_to_images + "\Lidar\*");
        files = string(extractfield(files, "name"))';
        files(files == "." | files == "..") = [];  % Eliminate "." (refers to itself) and ".." (parent folder)
        imagery_data.lidar_csvs = files(endsWith(files, ".csv"));
        imagery_data.lidar_pngs = files(endsWith(files, ".png"));
        imagery_data.lidar_other = files(~contains(files, [imagery_data.lidar_csvs; ...
                                                           imagery_data.lidar_pngs]));
    
        fprintf("%4s%-20s\n", "", "In the 'Lidar' subfolder (Lidar data)")
        fprintf("%10d %-30s\n", length(imagery_data.lidar_csvs), ".csv files")
        fprintf("%10d %-30s\n", length(imagery_data.lidar_pngs), ".png files")
        fprintf("%10d %-30s\n", length(imagery_data.lidar_other), "other files")
        if ~isempty(imagery_data.lidar_other)
            for index = 1:length(imagery_data.lidar_other)
                fprintf("%12s %-30s\n", "", imagery_data.lidar_other(index))
            end
        end
        fprintf("\n")
    end
end