# Team Thundercats

## Things to do, software wise
*This is in order of the neural network, not in order of importance / difficulty*

### *Data pre-processing steps that occur prior to training*
1. Download and unzip data from Box
2. Time interpolate the lidar/visible/infrared data. This includes:
- Ensuring that each lidar point cloud has a time-corresponding visible and infrared image. This also helps in **reducing memory requirements**, as the visible and infrared cameras took pictures at a signficantly higher sampling rate (~9 Hz compared to <2 Hz) than the lidar camera.
- Renaming the lidar/visible/infrared images so they are a more clear in terms time correlation
3. Extract the time-corresponding transmissometer/Malvern readings for each experiment
- This is stored in the `fog_chamber_environment` folder (rather than the baseline01, fog01, etc. folders)
4. Filter the transmissmeter/Malvern readings to reduce noise


### *Part of our ML framework / neural network architecture*
1. **Feature Extraction**
- Develop algorithms to feature extract a quantification of blurriness from visible, infrared, and lidar data
- Also involves things like cropping out the walls from lidar point clouds
2. General neural network design -- Answer questions like:
- After feature extraction, how many layers do we want to the neural network before it gives us the estimated transmissometer/Malvern data?
- What optimizer/loss function do we want to use?

### Then train the neural network!
