import pandas as pd
import numpy as np
from scipy.ndimage import variance
from skimage.filters import laplace
from PIL import Image
from pathlib import Path

# Pandas cheat sheet: https://pandas.pydata.org/Pandas_Cheat_Sheet.pdf

# File path fox Box
boxFolder = "c:\\Users\\andy1\\Box\\"

# File path to save the to-be-written csv file
csvsPath = boxFolder + "Glenn I Data\Csvs for Neural Network\\"


# Given the name of a test (baseline07, baseline08, fog16, etc.), load in the
# lidar depth maps, which are in 2D. To prepare the data for ML training, convert
# the data into 1D. Save all of the "flattened" depth maps into a csv, where
# each row corresponds to the 1D depth map of one file.

def flattenDepthMaps(testName):

    # Read csv to get file names of lidar depth maps
    df = pd.read_csv(csvsPath + testName + "_data_original.csv")

    # Location of depth maps
    pathToImages = boxFolder + "Glenn I Data\\Post-Time Interpolation Data\\" + testName + "_condensed\\"

    depthMapsCombined = []
    for depthMapName in df['lidarDepthMap']:

        # Depth maps are .tiff files
        if depthMapName.endswith(".csv"):
            depthMapName = depthMapName[:-3] + "tiff"

        # Get depth map values and flatten (convert from 2D to 1D)
        pixels = getPixels(pathToImages + depthMapName, grayscale=False)
        pixels_numpy = np.array(pixels).flatten()

        # Save 1D depth map, attached to the name of the depth map
        test = np.concatenate(([depthMapName], pixels_numpy))
        depthMapsCombined.append(test)

    # Save new csv file, where each row corresponds to a different 1D depth map
    np.savetxt(csvsPath + testName + "_depthMapsCombined.csv", 
               depthMapsCombined,
               delimiter =", ", 
               fmt ='% s')


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
    testName = "baseline07"
    print("Flattening depth maps for " + testName)
    flattenDepthMaps(testName)