import scipy.io
import os
import pandas as pd
import numpy as np
import os
from scipy.ndimage import variance
from skimage.filters import laplace
from PIL import Image
from pathlib import Path
import seaborn
import matplotlib.pyplot as plt
import cv2


def getPixels(img_dir, grayscale=False):
    img = Image.open(Path(img_dir))

    # convert to grayscale if requested
    if grayscale:
        img = img.convert("L")

    # return numpy array
    return np.array(img)

'''
def getPixels(img_dir, grayscale=False):
    img = cv2.imread(img_dir)
    # convert to grayscale if requested
    if grayscale:
        img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    # return numpy array
    return np.array(img)
'''

def laplace_filtering(img_list):
    img = np.array(img_list)
    edge_laplace = laplace(img, ksize=3)
    edge_laplace.real
    vari = (variance(edge_laplace))
    max_val = np.amax(edge_laplace)
    return vari, max_val


'''
def get_fft_stats(img_data):
    img_trans = np.absolute(np.fft.fft2(img_data))
    return (np.var(img_trans), np.amax(img_trans))
'''


def get_fft_stats(img_data):
    # get the magnitude spectrum
    img_trans = np.fft.fft2(img_data)
    shift = np.fft.fftshift(img_trans)
    mag_spec = 20*np.log(np.abs(shift))

    return (np.var(mag_spec), np.amax(mag_spec))


boxFolder = "c:\\Users\\andy1\\Box\\"

matFilePath = boxFolder + "Glenn Code\\Senior-Design-Shenanigans\\Andy H\\"
matFileName = "fog16 time-interpolated data UGH2.mat"

matFile = scipy.io.loadmat(matFilePath + matFileName, squeeze_me=True)


df = pd.DataFrame(matFile['doubles'], columns=["timeSinceStart",
                                               "MOR_meters",
                                               "MeanVD_microns",
                                               "LWC_gm-3"])
df["ImageIndex"] = matFile['imageNumbers']


pathToImages = boxFolder + "Glenn I Data\\Andy Blah\\fog16_condensed\\"

visibleInfo = []
infraredInfo = []

startIndex = df["ImageIndex"][0]

#endIndex = startIndex+100
endIndex = df["ImageIndex"].iat[-1]

for index in range(startIndex, endIndex+1, 1):
    print("----Running extraction for image", index-startIndex+1,"out of", endIndex-startIndex+1, "----")
    visibleImageName = pathToImages + "Visible" + str(index) + ".jpg"
    infraredImageName = pathToImages + "Infrared" + str(index) + ".tiff"
    lidarImageName = pathToImages + "Lidar" + str(index) + ".csv"

    visibleImage = getPixels(visibleImageName, grayscale=True)
    # Convert visible image to grayscale

    infraredImage = getPixels(infraredImageName)

    (visVariance_lap, visMax_lap) = laplace_filtering(visibleImage)
    (visVariance_fft, visMax_fft) = get_fft_stats(visibleImage)
    visibleInfo.append([visVariance_lap, visMax_lap, visVariance_fft, visMax_fft])

    (infVariance_lap, infMax_lap) = laplace_filtering(infraredImage)
    (infVariance_fft, infMax_fft) = get_fft_stats(infraredImage)
    infraredInfo.append([infVariance_lap, infMax_lap, infVariance_fft, infMax_fft])

df[["Vis_LapVar", "Vis_LapMax", "Vis_FFTVar", "Vis_FFTMax"]] = np.array(visibleInfo)
df[["Inf_LapVar", "Inf_LapMax", "Inf_FFTVar", "Inf_FFTMax"]] = np.array(infraredInfo)
df.to_csv("Fog16 feature extraction data.csv")


#df_subset = pd.DataFrame(visibleInfo, columns=["Laplacian_Variance",
#                                                "Lapacian_Maximum",
#                                                "FFT_Variance",
#                                                "FFT_Maximum"])
#df[["Inf_LapVar", "Inf_LapMax", "Inf_FFTVar", "Inf_FFTMax"]] = infraredInfo
#df_subset[["MOR_meters", "MeanVD_microns"]] = df[["MOR_meters", "MeanVD_microns"]]
#df_subset.to_csv("Fog16 feature extraction data.csv")

#df_save = df_visible.copy(deep=True)
#df_save["ImageNumber"] = list(range(startIndex, endIndex+1, 50))
#df_save.to_csv("Testing.csv")

#seaborn.set_theme()
#seaborn.pairplot(df_visible)
#plt.show()
