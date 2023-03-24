clc; clear; close all;

exp_name = "fog16";
fType = "Infrared"; %Visible
fs = 1.309; % [hz]

path = 'C:\Users\benrd\Box\Glenn I Data\Post-Time Interpolation Data\' + exp_name + '_condensed';
addpath(path)



num_files = 5:3275; % (16) 5:3275, (07) 10:151, (08) 5:122
for i = 1:length(num_files)

    names_files(i) = sprintf("%s%d.tiff",fType, num_files(i));
   
end



data_X = [];
data_Y = [];
for i = 1:length(num_files)
% Read in image file
    img = imread(names_files(i));
%     bmp_img = im2uint8(img);
    x = double((img)); %rgb2gray

    N = size(x,1);
    xdft = dct(x,[],1);
    xdft = xdft(1:N/2+1);
    psdx = (1/(fs*N)) * abs(xdft).^2;
    psdx(2:end-1) = 2*psdx(2:end-1);
    freqx = 0:fs/N:fs/2;

    N = size(x,2);
    xdft = dct(x,[],2);
    xdft = xdft(1:N/2+1);
    psdy = (1/(fs*N)) * abs(xdft).^2;
    psdy(2:end-1) = 2*psdy(2:end-1);
    freq = 0:fs/N:fs/2;
    

    data_X = [data_X;
              names_files(i) num2cell(pow2db(psdx))];

    data_Y = [data_Y; names_files(i) num2cell(pow2db(psdy))];
    clc
    disp((i/length(num_files))*100)
end
    filename = exp_name + '_' + fType + 'X.csv';
    writematrix(data_X, filename)
    filename = exp_name + '_' + fType + 'Y.csv';
    writematrix(data_Y, filename)
% figure;
% hold on;

% plot(freq,pow2db(psdy))
% plot(freqx,pow2db(psdx))
% legend('y', 'x')
% grid on
% title("DCT power spectrum")
% xlabel("freq")
% ylabel("Power/Frequency (dB/Hz)")


%https://ieeexplore-ieee-org.ezproxy.lib.utexas.edu/stamp/stamp.jsp?tp=&arnumber=1163711

%"Heideman, M.T., Johnson, D.H. and Burrus, C.S., 1984. Gauss and the history of the fast Fourier transform. Archive for history of exact sciences, 29(4), pp.345-370."

% for i = 1:length(num_files)
%     img = imread(names_files(i));
%     x = rgb2gray(img);
%     break
%     N = length(x);
%     xdft = fft(x);
%     xdft = xdft(1:N/2+1);
%     psdx = (1/(fs*N)) * abs(xdft).^2;
%     psdx(2:end-1) = 2*psdx(2:end-1);
%     freq = 0:fs/length(x):fs/2;
% 
%     plot(freq,pow2db(psdx))
%     grid on
%     title("Periodogram Using FFT")
%     xlabel("Frequency (Hz)")
%     ylabel("Power/Frequency (dB/Hz)")
% end