# Function used to retrieve data needed to train and evaluate neural network

import pandas as pd
import numpy as np
from scipy.ndimage import variance
from skimage.filters import laplace
from PIL import Image
from pathlib import Path


# Pandas cheat sheet: https://pandas.pydata.org/Pandas_Cheat_Sheet.pdf

# Will be used to train neural network, as well as evaluate NN
def getFog16Data():
    df = pd.read_csv("File that ben is creating.csv")

    # If laplacian variance column doesn't exist yet...
        # Retrieve laplacian variance of both Infrared and Visible images, store
        # within DataFrame
        # Save modified DataFrame to csv

    # Iterate through infrared and visible pictures to...
        # Get DCT power spectrums in both x and y
        # Probably save this in a csv file too, something like each row is a power spectrum (and there are 4 sheets for both axes + both infrared/visible?)

    # Get Lidar ping distribution and depth maps
        # Also save these in a csv file

    # Add everything into some VERY large dictionary like "all_data"

    # Split into 80-20 (pick random rows i guess?) for training and test

    # Return training set and test set
    return (training_set, test_set)

        # Format for both should look like this:
        # Do NOT change the name of the keys!
    '''
    training_set["inputs"] = 
             {"Lidar_Depth_Map": <something>,
            "Lidar_Ping_Distribution": etc.,
            "Visible_Laplacian_Variance": <something>,
            "Visible_Power_Spectrum_X": you get the point...,
            "Visible_Power_Spectrum_Y": fakeVisibleDCT_Y,
            "Infrared_Laplacian_Variance": fakeInfraredLapVar,
            "Infrared_Power_Spectrum_X": fakeInfraredDCT_X,
            "Infrared_Power_Spectrum_Y": fakeInfraredDCT_Y,}

    training_set["outputs"] = {"MOR_and_LWC_estimates": np.random.rand(numCorrelatedImages, 2)}
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


# Calculate and return the variance of an image after running it through a
# Laplacian filter
def laplace_filtering(img_list):
    img = np.array(img_list)
    edge_laplace = laplace(img, ksize=3)
    edge_laplace.real
    return variance(edge_laplace)


# Given the file path to an image, retrieve the pixel values
# Option to change RGB to grayscale
def getPixels(img_dir, grayscale=False):
    img = Image.open(Path(img_dir))

    # convert to grayscale if requested
    if grayscale:
        img = img.convert("L")

    # return numpy array
    return np.array(img)
