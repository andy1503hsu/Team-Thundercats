# Function used to get laplacian variance of infrared and visible images and
# save this information in a .csv

import pandas as pd
import numpy as np
from scipy.ndimage import variance
from skimage.filters import laplace
from PIL import Image
from pathlib import Path


# Pandas cheat sheet: https://pandas.pydata.org/Pandas_Cheat_Sheet.pdf


boxFolder = "c:\\Users\\andy1\\Box\\"
csvsPath = boxFolder + "Glenn I Data\Csvs for Neural Network\\"

# Will be used *only* to evaluate neural network
# Baseline07 and 08 do NOT have transmissometer/Malvern data, so they cannot be
# used for training
def getBaselineData(testNumber):

    if testNumber == 7:
        df = pd.read_csv(csvsPath + "baseline07_data_original.csv")
        pathToImages = boxFolder + "Glenn I Data\\Post-Time Interpolation Data\\baseline07_condensed\\"
    elif testNumber == 8:
        df = pd.read_csv(csvsPath + "baseline08_data_original.csv")
        pathToImages = boxFolder + "Glenn I Data\\Post-Time Interpolation Data\\baseline08_condensed\\"
    else:
        print("Invalid baseline test number.")
        return

    if 'visibleLapVar' not in df.columns:

        visVariances = [laplace_filtering(getPixels(pathToImages + imageName, grayscale=True)) for imageName in df['visibleBitmap']]
        df['visibleLapVar'] = visVariances
        df.to_csv(csvsPath + "baseline0X_dataEdited1.csv")

        infraredVariances = [laplace_filtering(getPixels(pathToImages + imageName)) for imageName in df['infraredImage']]
        df['infaredLapVar'] = infraredVariances

        df.to_csv(csvsPath + "baseline0X_dataEdited2.csv")


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
    dataset = getBaselineData(8)