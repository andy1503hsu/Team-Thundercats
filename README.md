# Senior-Design-Shenanigans

## Things to do, software wise
*This is in order of the neural network, not in order of importance / difficulty*

*----Data pre-processing steps that occur prior to training*
1. Download and unzip data from Box
2. Time interpolate the lidar/visible/infrared data. This includes:
- Ensuring that each lidar point cloud has a time-corresponding visible and infrared image. This also helps in **reducing memory requirements**, as the visible and infrared cameras took pictures at a signficantly higher sampling rate (~9 Hz compared to <2 Hz) than the lidar camera.
- Renaming the lidar/visible/infrared images so they are a LOT more clear in terms time correlation
3. Extract the time-corresponding transmissometer/Malvern readings for each experiment
- This is stored in the `fog_chamber_environment` folder (rather than the baseline01, fog01, etc. folders)
4. Filter the transmissmeter/Malvern readings to reduce noise
- 3 and 4 could be swapped? Maybe?
- It might actually be better to do 4 before 3 due to filters being wonky at the edges


*----Part of our ML framework / neural network architecture*
1. **Feature Extraction Things**
- Develop algorithms to feature extract a quantification of blurriness from visible, infrared, and lidar data
- Also involves things like cropping out the walls from lidar point clouds
2. General neural network design -- Answer questions like:
- After feature extraction, how many layers do we want to the neural network before it gives us the estimated transmissometer/Malvern data?
- What optimizer/loss function do we want to use?

*----Related to training the neural network*
1. How do decide what data goes in the training set and what goes in the validation/testing set?
2. Anything else?


## What is left to download into Box?
*Update this to reflect changes!*

[NASA conducted](https://workshops.larc.nasa.gov/RAM_Fog_Test/) 13 baseline tests, 25 fog tests, and 2 public affairs office (PAO) tests. There is data for 9 baseline, 18 fog, and 1 PAO test.

In the box folder, we currently have:
- All 9 baseline tests **unzipped** (01, 02, 03, 04, 07, 08, 09, 11, 12)
- 2 fog tests **unzipped** (01, 16)
- 4 fog tests **zipped** (02, 03, 04, 09)
- 1 PAO test **zipped** (02)

This means we still have:
- 0 baseline, 12 fog, and 0 PAO tests to **download their zipped folders from the NASA site** (06, 08, 10, 11, 12, 14, 15, 17, 18, 20, 22, 24)
- 0 baseline, 16 fog, and 1 PAO test to **unzip** (the above to-be-downloaded tests plus fog02, fog03, fog04, fog09, and pao02)

A big issue is that downloading and unzipping these files use up the memory of the local computer. Box *does* upload the files to the cloud and free up local computer memory, but the fact remains that these files require local memory, even for just a temporary amount of time.

For example, let's say a computer has 20 GB of free storage left and there is one 16 GB file and another 10 GB file to download. Obviously, the computer cannot download both files at the same time, but they could download the first file (and have 4 GB free memory remaining). Then, *after Box uploads the now-downloaded file to the cloud*, the computer will have 20 GB of free storage again, and *now* the second file can be downloaded. In short, this may have to be a rather time-intensive process.


## What is left to time interpolate?
*Update this to reflect changes!*

The following tests have been time interpolated (within the "Glenn Data"/"Andy Blah" folder on Box):
- Baseline tests 01, 02, 03, 04, 07, 08, 11
- Fog tests 01, 16

The following tests have NOT been time interpolated. However, downloading/unzipping the file is a pre-req for this step.
- Baseline tests 09, 12
- Fog tests 02, 03, 04, 06, 08, 10, 11, 12, 14, 15, 17, 18, 20, 22, 24
- PAO test 02
