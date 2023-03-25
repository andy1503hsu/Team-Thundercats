import pandas as pd
import numpy as np
from scipy.ndimage import variance
from skimage.filters import laplace
from PIL import Image
from pathlib import Path

# Pandas cheat sheet: https://pandas.pydata.org/Pandas_Cheat_Sheet.pdf


boxFolder = "c:\\Users\\andy1\\Box\\"
csvsPath = boxFolder + "Glenn I Data\Csvs for Neural Network\\"

def flattenFog16DepthMaps():
    df = pd.read_csv(csvsPath + "fog16_data.csv")
    pathToImages = boxFolder + "Glenn I Data\\Post-Time Interpolation Data\\fog16_condensed\\"

    depthMapsCombined = []
    for depthMapName in df['lidarDepthMap']:
        pixels = getPixels(pathToImages + depthMapName, grayscale=False)
        pixels_numpy = np.array(pixels).flatten()
        test = np.concatenate(([depthMapName], pixels_numpy))
        depthMapsCombined.append(test)

    np.savetxt(csvsPath + "fog16_depthMapsCombined.csv", 
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
    flattenFog16DepthMaps()