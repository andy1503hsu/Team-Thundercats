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
    pathToImages = boxFolder + "Glenn I Data\\Post-Time Interpolation Data\\fog16_condensed\\"

    # If laplacian variance column doesn't exist yet...
        # Retrieve laplacian variance of both Infrared and Visible images, store
        # within DataFrame
        # Save modified DataFrame to csv
    if 'visibleLapVar' not in df.columns:

        visVariances = [laplace_filtering(getPixels(pathToImages + imageName, grayscale=True)) for imageName in df['visibleBitmap']]
        df['visibleLapVar'] = visVariances
        # df.to_csv(csvsPath + "fog16_dataEdited1.csv")

        infraredVariances = [laplace_filtering(getPixels(pathToImages + imageName)) for imageName in df['infraredImage']]
        df['infaredLapVar'] = infraredVariances

        df.to_csv(csvsPath + "fog16_dataEdited2.csv")  # Rename after saving

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

    # Normalize Inputs
    (visibleLapVar_normalized, visibleLapVar_normInfo) = normalizeData(df['visibleLapVar'].values)
    (visiblePSD_x_normalized, visiblePSD_x_normInfo) = normalizeData(visiblePSD_x)
    (visiblePSD_y_normalized, visiblePSD_y_normInfo) = normalizeData(visiblePSD_y)

    (infraredLapVar_normalized, infraredLapVar_normInfo) = normalizeData(df['infraredLapVar'].values)
    (infraredPSD_x_normalized, infraredPSD_x_normInfo) = normalizeData(infraredPSD_x)
    (infraredPSD_y_normalized, infraredPSD_y_normInfo) = normalizeData(infraredPSD_y)

    (lidarDepthMaps_normalized, lidarDepthMaps_normInfo) = normalizeData(lidarDepthMaps, 0, 255)
    (lidarPingDist_normalized, lidarPingDist_normInfo) = normalizeData(lidarPingDist)

    # Add everything into some VERY large dictionary like "all_data"

    # Split into 80-20 for training and test
    trainProportion = 0.8

    # Get first and last image names
    firstImageIndex = re.findall("\d+", visibleImages[0]+infraredImages[0]+lidarImages[0])
    lastImageIndex = re.findall("\d+", visibleImages[-1]+infraredImages[-1]+lidarImages[-1])
    # These should be the same
    assert firstImageIndex[0] == firstImageIndex[1] == firstImageIndex[2]
    assert lastImageIndex[0] == lastImageIndex[1] == lastImageIndex[2]

    firstImageIndex = int(firstImageIndex[0])
    lastImageIndex = int(lastImageIndex[0])

    trainSetIndexes = []
    testSetIndexes = []

    for index in range(firstImageIndex, lastImageIndex+1, 1):
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

    train_set["outputs"]["MOR_and_LWC_estimates"] = df.loc[trainSetIndexes, ["MOR532_m_filt", "LWC_gm3_filt"]].values


    test_set = {"inputs": {}, "outputs": {}, 'indexes': testSetIndexes}
    test_set["inputs"]["Visible_Laplacian_Variance"] = visibleLapVar_normalized[testSetIndexes]
    test_set["inputs"]["Visible_Power_Spectrum_X"] = visiblePSD_x_normalized[testSetIndexes, :]
    test_set["inputs"]["Visible_Power_Spectrum_Y"] = visiblePSD_y_normalized[testSetIndexes, :]

    test_set["inputs"]["Infrared_Laplacian_Variance"] = infraredLapVar_normalized[testSetIndexes]
    test_set["inputs"]["Infrared_Power_Spectrum_X"] = infraredPSD_x_normalized[testSetIndexes, :]
    test_set["inputs"]["Infrared_Power_Spectrum_Y"] = infraredPSD_y_normalized[testSetIndexes, :]

    test_set["inputs"]["Lidar_Depth_Map"] = lidarDepthMaps_normalized[testSetIndexes, :]
    test_set["inputs"]["Lidar_Ping_Distribution"] = lidarPingDist_normalized[testSetIndexes, :]

    test_set["outputs"]["MOR_and_LWC_estimates"] = df.loc[testSetIndexes, ["MOR532_m_filt", "LWC_gm3_filt"]].values

    # Return training set and test set
    return (train_set, test_set)

        # Format for both should look like this:
        # Do NOT change the name of the keys!
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
def getBaselineData(testNumber):

    if testNumber == 7:
        df = pd.read_csv("Another file ben is creating.csv")
    elif testNumber == 8:
        df = pd.read_csv("Another another file ben is creating.csv")
    else:
        print("Invalid baseline test number.")
        return

    # If laplacian variance column doesn't exist yet...
            # Retrieve laplacian variance of both Infrared and Visible images, store
            # within DataFrame
            # Save modified DataFrame to csv

    # Get DCT power spectrums in both x and y

    # Get Lidar ping distribution and depth maps

    # Return dataset (will be exclusively used for evalulation/testing)


# Normalize data so all values are in betwen 0 and 1 inclusive. Return new
# values, plus the offset and scale needed to do the normalization
def normalizeData(data, minimum=None, maximum=None):
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