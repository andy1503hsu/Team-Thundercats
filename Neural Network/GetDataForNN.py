# Function used to retrieve data needed to train and evaluate neural network

import pandas as pd
import numpy as np
from scipy.ndimage import variance
from skimage.filters import laplace
from PIL import Image
from pathlib import Path
import re

# Pandas cheat sheet: https://pandas.pydata.org/Pandas_Cheat_Sheet.pdf


boxFolder = "c:\\Users\\andy1\\Box\\"
csvsPath = boxFolder + "Glenn I Data\Csvs for Neural Network\\"

# Will be used to train neural network, as well as evaluate NN
def getFog16Data():
    df = pd.read_csv(csvsPath + "fog16_data_withLapVars.csv")

    # If laplacian variance column doesn't exist yet...
        # Retrieve laplacian variance of both Infrared and Visible images, store
        # within DataFrame
        # Save modified DataFrame to csv
    if 'visibleLapVar' not in df.columns:

        pathToImages = boxFolder + "Glenn I Data\\Post-Time Interpolation Data\\fog16_condensed\\"

        visVariances = [laplace_filtering(getPixels(pathToImages + imageName, grayscale=True)) for imageName in df['visibleBitmap']]
        df['visibleLapVar'] = visVariances
        # df.to_csv(csvsPath + "fog16_dataEdited1.csv")

        infraredVariances = [laplace_filtering(getPixels(pathToImages + imageName)) for imageName in df['infraredImage']]
        df['infraredLapVar'] = infraredVariances

        df.to_csv(csvsPath + "fog16_dataEdited2.csv")  # Rename after saving
        print("Wrote .csv file with Laplacian variance of visible and infrared pictures.")
        return

    # # Get DCT power spectrums in both x and y

    pathtoPSDs = csvsPath + "\\POWER SPECTRUMS\\"
    (visibleImages, visiblePSD_x) = read_csvs(pathtoPSDs + "fog16_VisibleX.csv")

    # Eliminate columns with negative infinity
    visiblePSD_x = visiblePSD_x[:, :-1]
    visiblePSD_x = np.delete(visiblePSD_x, 128, axis=1)

    (_, visiblePSD_y) = read_csvs(pathtoPSDs + "fog16_VisibleY.csv")
    (infraredImages, infraredPSD_x) = read_csvs(pathtoPSDs + "fog16_InfraredX.csv")
    (_, infraredPSD_y) = read_csvs(pathtoPSDs + "fog16_InfraredY.csv")

    # Get Lidar depth maps
    (lidarImages, lidarDepthMaps) = read_csvs(csvsPath + "fog16_depthMapsCombined.csv")

    # Get Lidar ping distribution
    (_, lidarPingDist) = read_csvs(csvsPath + "fog16_LidarDepthDist.csv")

    # Get first and last image names
    firstImageIndex = re.findall("\d+", visibleImages[0]+infraredImages[0]+lidarImages[0])
    lastImageIndex = re.findall("\d+", visibleImages[-1]+infraredImages[-1]+lidarImages[-1])

    # These should be the same to ensure indices are consistent
    assert firstImageIndex[0] == firstImageIndex[1] == firstImageIndex[2]
    assert lastImageIndex[0] == lastImageIndex[1] == lastImageIndex[2]

    # Normalize Inputs
    (visibleLapVar_normalized, visibleLapVar_normInfo) = normalizeData(df['visibleLapVar'].values)
    (visiblePSD_x_normalized, visiblePSD_x_normInfo) = normalizeData(visiblePSD_x)
    (visiblePSD_y_normalized, visiblePSD_y_normInfo) = normalizeData(visiblePSD_y)

    (infraredLapVar_normalized, infraredLapVar_normInfo) = normalizeData(df['infraredLapVar'].values)
    (infraredPSD_x_normalized, infraredPSD_x_normInfo) = normalizeData(infraredPSD_x)
    (infraredPSD_y_normalized, infraredPSD_y_normInfo) = normalizeData(infraredPSD_y)

    (lidarDepthMaps_normalized, lidarDepthMaps_normInfo) = normalizeData(lidarDepthMaps, 0, 255)
    (lidarPingDist_normalized, lidarPingDist_normInfo) = normalizeData(lidarPingDist)
    input_normInfo = [visibleLapVar_normInfo, visiblePSD_x_normInfo, 
                      visiblePSD_y_normInfo, infraredLapVar_normInfo,
                      infraredPSD_x_normInfo, infraredPSD_x_normInfo,
                      infraredPSD_y_normInfo, lidarDepthMaps_normInfo,
                      lidarPingDist_normInfo]

    # Normalize outputs
    (MOR_normalized, MOR_normInfo) = normalizeData(df["MOR532_m_filt"])
    (LWC_normalized, LWC_normInfo) = normalizeData(df["LWC_gm3_filt"])
    df["MOR_normalized"] = MOR_normalized
    df["LWC_normalized"] = LWC_normalized

    # Split into 80-20 for training and test
    trainProportion = 0.8

    firstImageIndex = int(firstImageIndex[0])
    lastImageIndex = int(lastImageIndex[0])

    trainSetIndexes = []
    testSetIndexes = []

    # Ignore first 60 images, since this is when fog was entering the chamber
    for index in range(firstImageIndex + 60, lastImageIndex+1, 1):
        randNum = np.random.random()
        if randNum <= trainProportion:
            # Convert from image *number* to index within time correlation
            trainSetIndexes.append(index - firstImageIndex)
        else:
            testSetIndexes.append(index - firstImageIndex)

    train_set = {"inputs": {}, "outputs": {}, 'indexes': trainSetIndexes}
    train_set["inputs"]["Visible_Laplacian_Variance"] = visibleLapVar_normalized[trainSetIndexes]
    train_set["inputs"]["Visible_Power_Spectrum_X"] = visiblePSD_x_normalized[trainSetIndexes, :]
    train_set["inputs"]["Visible_Power_Spectrum_Y"] = visiblePSD_y_normalized[trainSetIndexes, :]

    train_set["inputs"]["Infrared_Laplacian_Variance"] = infraredLapVar_normalized[trainSetIndexes]
    train_set["inputs"]["Infrared_Power_Spectrum_X"] = infraredPSD_x_normalized[trainSetIndexes, :]
    train_set["inputs"]["Infrared_Power_Spectrum_Y"] = infraredPSD_y_normalized[trainSetIndexes, :]
    
    train_set["inputs"]["Lidar_Depth_Map"] = lidarDepthMaps_normalized[trainSetIndexes, :]
    train_set["inputs"]["Lidar_Ping_Distribution"] = lidarPingDist_normalized[trainSetIndexes, :]

    train_set["outputs"]["MOR_and_LWC_estimates"] = df.loc[trainSetIndexes, ["MOR_normalized", "LWC_normalized"]].values


    test_set = {"inputs": {}, "outputs": {}, 'indexes': testSetIndexes}
    test_set["inputs"]["Visible_Laplacian_Variance"] = visibleLapVar_normalized[testSetIndexes]
    test_set["inputs"]["Visible_Power_Spectrum_X"] = visiblePSD_x_normalized[testSetIndexes, :]
    test_set["inputs"]["Visible_Power_Spectrum_Y"] = visiblePSD_y_normalized[testSetIndexes, :]

    test_set["inputs"]["Infrared_Laplacian_Variance"] = infraredLapVar_normalized[testSetIndexes]
    test_set["inputs"]["Infrared_Power_Spectrum_X"] = infraredPSD_x_normalized[testSetIndexes, :]
    test_set["inputs"]["Infrared_Power_Spectrum_Y"] = infraredPSD_y_normalized[testSetIndexes, :]

    test_set["inputs"]["Lidar_Depth_Map"] = lidarDepthMaps_normalized[testSetIndexes, :]
    test_set["inputs"]["Lidar_Ping_Distribution"] = lidarPingDist_normalized[testSetIndexes, :]

    test_set["outputs"]["MOR_and_LWC_estimates"] = df.loc[testSetIndexes, ["MOR_normalized", "LWC_normalized"]].values

    # Return training set and test set
    return (train_set, test_set, MOR_normInfo, LWC_normInfo, input_normInfo)

    '''
    train_set["inputs"] = 
             {"Lidar_Depth_Map": <something>,
            "Lidar_Ping_Distribution": etc.,
            "Visible_Laplacian_Variance": <something>,
            "Visible_Power_Spectrum_X": you get the point...,
            "Visible_Power_Spectrum_Y": fakeVisibleDCT_Y,
            "Infrared_Laplacian_Variance": fakeInfraredLapVar,
            "Infrared_Power_Spectrum_X": fakeInfraredDCT_X,
            "Infrared_Power_Spectrum_Y": fakeInfraredDCT_Y,}

    train_set["outputs"] = {"MOR_and_LWC_estimates": np.random.rand(numCorrelatedImages, 2)}
    '''


# Will be used *only* to evaluate neural network
# Baseline07 and 08 do NOT have transmissometer/Malvern data, so they cannot be
# used for training
def getBaselineData(testName, input_normInfo):

    df = pd.read_csv(csvsPath + testName + "_data_withLapVars.csv")

    # If laplacian variance column doesn't exist yet...
        # Retrieve laplacian variance of both Infrared and Visible images, store
        # within DataFrame
        # Save modified DataFrame to csv
    if 'visibleLapVar' not in df.columns:

        pathToImages = boxFolder + "Glenn I Data\\Post-Time Interpolation Data\\" + testName + "_condensed\\"

        visVariances = [laplace_filtering(getPixels(pathToImages + imageName, grayscale=True)) for imageName in df['visibleBitmap']]
        df['visibleLapVar'] = visVariances
        # df.to_csv(csvsPath + testName + "_dataEdited1.csv")

        infraredVariances = [laplace_filtering(getPixels(pathToImages + imageName)) for imageName in df['infraredImage']]
        df['infraredLapVar'] = infraredVariances

        df.to_csv(csvsPath + testName + "_dataEdited2.csv")  # Rename after saving

        print("Wrote .csv file with Laplacian variance of visible and infrared pictures.")
        return

    # # Get DCT power spectrums in both x and y

    pathtoPSDs = csvsPath + "\\POWER SPECTRUMS\\"
    (visibleImages, visiblePSD_x) = read_csvs(pathtoPSDs + testName + "_VisibleX.csv")

    # Eliminate columns with negative infinity
    visiblePSD_x = visiblePSD_x[:, :-1]
    visiblePSD_x = np.delete(visiblePSD_x, 128, axis=1)

    (_, visiblePSD_y) = read_csvs(pathtoPSDs + testName + "_VisibleY.csv")
    (infraredImages, infraredPSD_x) = read_csvs(pathtoPSDs + testName + "_InfraredX.csv")
    (_, infraredPSD_y) = read_csvs(pathtoPSDs + testName + "_InfraredY.csv")

    # Get Lidar depth maps
    (lidarImages, lidarDepthMaps) = read_csvs(csvsPath + testName + "_depthMapsCombined.csv")

    # Get Lidar ping distribution
    (_, lidarPingDist) = read_csvs(csvsPath + testName + "_LidarDepthDist.csv")

    # Get first and last image names
    firstImageIndex = re.findall("\d+", visibleImages[0]+infraredImages[0]+lidarImages[0])
    lastImageIndex = re.findall("\d+", visibleImages[-1]+infraredImages[-1]+lidarImages[-1])

    # These should be the same to ensure indices are consistent
    assert firstImageIndex[0] == firstImageIndex[1] == firstImageIndex[2]
    assert lastImageIndex[0] == lastImageIndex[1] == lastImageIndex[2]

    # Normalize Inputs
    (visibleLapVar_normalized, _) = normalizeData(df['visibleLapVar'].values, normInfo=input_normInfo[0])
    (visiblePSD_x_normalized, _) = normalizeData(visiblePSD_x, normInfo=input_normInfo[1])
    (visiblePSD_y_normalized, _) = normalizeData(visiblePSD_y, normInfo=input_normInfo[2])

    (infraredLapVar_normalized, _) = normalizeData(df['infraredLapVar'].values, normInfo=input_normInfo[3])
    (infraredPSD_x_normalized, _) = normalizeData(infraredPSD_x, normInfo=input_normInfo[4])
    (infraredPSD_y_normalized, _) = normalizeData(infraredPSD_y, normInfo=input_normInfo[5])

    (lidarDepthMaps_normalized, _) = normalizeData(lidarDepthMaps, normInfo=input_normInfo[6])
    (lidarPingDist_normalized, _) = normalizeData(lidarPingDist, normInfo=input_normInfo[7])

    # Baseline data is not used in training, so no train-test split is needed

    dataset = {"inputs": {}}
    dataset["inputs"]["Visible_Laplacian_Variance"] = visibleLapVar_normalized
    dataset["inputs"]["Visible_Power_Spectrum_X"] = visiblePSD_x_normalized
    dataset["inputs"]["Visible_Power_Spectrum_Y"] = visiblePSD_y_normalized

    dataset["inputs"]["Infrared_Laplacian_Variance"] = infraredLapVar_normalized
    dataset["inputs"]["Infrared_Power_Spectrum_X"] = infraredPSD_x_normalized
    dataset["inputs"]["Infrared_Power_Spectrum_Y"] = infraredPSD_y_normalized
    
    dataset["inputs"]["Lidar_Depth_Map"] = lidarDepthMaps_normalized
    dataset["inputs"]["Lidar_Ping_Distribution"] = lidarPingDist_normalized

    # Return dataset
    return dataset


# Normalize data so all values are in betwen 0 and 1 inclusive. Return new
# values, plus the offset and scale needed to do the normalization
def normalizeData(data, minimum=None, maximum=None, normInfo=None):

    if normInfo is not None:
        normalizedData = (data - normInfo["offset"]) / normInfo["scale"]
        return (normalizedData, {})
    
    if minimum is None:
        minimum = np.min(data)

    if maximum is None:
        maximum = np.max(data)

    normalizedData = (data - minimum) / (maximum - minimum)

    normInfo = {}
    normInfo["offset"] = minimum
    normInfo["scale"] = maximum-minimum
    return (normalizedData, normInfo)


def read_csvs(filePath):
    fileInfo = np.loadtxt(filePath,
                          delimiter=",",
                          dtype=str)
    imageNames = fileInfo[:, 0]
    psds = np.asarray(fileInfo[:, 1:], dtype=float)
    return (imageNames, psds)


# Calculate and return the variance of an image after running it through a
# Laplacian filter
def laplace_filtering(img_list):
    # img = np.array(img_list)
    edge_laplace = laplace(img_list, ksize=3)
    edge_laplace.real
    return variance(edge_laplace)


# Given the file path to an image, retrieve the pixel values
# Option to change RGB to grayscale
def getPixels(img_dir, grayscale=False):
    print(img_dir)
    img = Image.open(Path(img_dir), mode="r")

    # convert to grayscale if requested
    if grayscale:
        img = img.convert("L")

    # return numpy array
    return np.array(img)

if __name__ == "__main__":
    (train_set, test_set) = getFog16Data()
    # baseline07_data = getBaselineData("baseline07")