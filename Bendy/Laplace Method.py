import numpy as np
import matplotlib.pyplot as plt
import os
from pathlib import Path
import glob
from natsort import natsort_keygen, ns
from scipy.ndimage import variance
from skimage import io 
from skimage.color import rgb2gray
from skimage.filters import laplace
from skimage.transform import resize

directory = 'C:/Users/benrd/Box/Glenn I Data/Andy Blah/fog16_condensed/'
 
# iterate over files in
# that directory


#==================================fog01==========================================#

dire1 = f'C:/Users/benrd/Box/Glenn I Data/Andy Blah/fog16_condensed/Visible1.jpg'

fog01_namez = []

j = 0
for filename in glob.iglob(f'{directory}/*.jpg'):
    if j > 40:
        break
    #filename = os.path.basename(filename) <---- takes off dir
    fog01_namez.append(filename)
    j = j + 1
    print(j)

natsort_key1 = natsort_keygen(key=lambda y: y.lower())
fog01_namez.sort(key=natsort_key1)



#laplace
fog01_vari = np.empty([], dtype = float)
fog01_max = np.empty([], dtype = float)
j = 0
for i in fog01_namez:
    path = i

    
    img = io.imread(path)
    img = resize(img, (400, 600))
    img = rgb2gray(img)

    edge_laplace = laplace(img, ksize=3)
    #edge_laplace = np.fft.fft2(img)
    edge_laplace.real

    fog01_vari = np.append(fog01_vari, variance(edge_laplace))

    fog01_max = np.append(fog01_max, np.amax(edge_laplace))


print(f"Fog Variance: {fog01_vari}")
print(f'Maximum: {fog01_max}')

#==================================baseline01==========================================#

dire2 = f'C:/Users/benrd/Box/Glenn I Data/Andy Blah/baseline01_condensed/'

baseline01_namez = []

for filename in glob.iglob(f'{dire2}/*.jpg'):
    #filename = os.path.basename(filename) <---- takes off dir
    baseline01_namez.append(filename)

natsort_key1 = natsort_keygen(key=lambda y: y.lower())
baseline01_namez.sort(key=natsort_key1)


#laplace
baseline01_vari = np.empty([], dtype = float)
baseline01_max = np.empty([], dtype = float)

for i in baseline01_namez:
    path2 = i
    
    img2 = io.imread(path2)
    img2 = resize(img2, (400, 600))
    img2 = rgb2gray(img2)
    
    edge_laplace2 = laplace(img2, ksize=3)
    #edge_laplace2 = np.fft.fft2(img2)
    edge_laplace2.real
    baseline01_vari = np.append(baseline01_vari, variance(edge_laplace2))

    baseline01_max = np.append(baseline01_max, np.amax(edge_laplace2))


print(f"Baseline Variance: {baseline01_vari}")
print(f'Maximum: {baseline01_max}')

#fig, ax = plt.subplots()
plt.scatter(fog01_vari, fog01_max, c='b', marker="s", label='fog16')
plt.scatter(baseline01_vari, baseline01_max, c='r', marker="o" ,label='baseline01')

#plt.xlim(0, .0001)
#plt.ylim(1,3)
plt.xlabel('Variance')
plt.ylabel('Maximum')
plt.legend(loc='upper left')
plt.show()