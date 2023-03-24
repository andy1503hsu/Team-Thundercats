clc; clear; close all;

addpath('C:\Users\benrd\Box\Glenn I Data\Post-Time Interpolation Data\baseline08_oldjpgs')

im_folder2 = 'C:\Users\benrd\Box\Glenn I Data\Post-Time Interpolation Data\baseline07_condensed'

im_folder = 'C:\Users\benrd\OneDrive - The University of Texas at Austin\Desktop\Senior-Design-Shenanigans\Bendy\baseline08_vis'


tic
num_files = 5:122; %3275
for i = 1:length(num_files)

    names_files(i) = sprintf("Visible%d.jpg", num_files(i));
    new_names(i) = sprintf("Visible%d.bmp", num_files(i));
    new_filepath(i) = fullfile(im_folder, new_names(i));
end

for i = 1:length(num_files)
    img = imread(names_files(i));
    img_chop = img(49:2000, 5:2444, :);
    img_resize = imresize(img_chop, [512, 640]);
    
    imwrite(img_resize, new_filepath(i));
    clc
    disp(i)
end
toc
