clc; close; clear all;

%loads intensity data
load('intense.mat');
sec_cycle = 1.3^-1;
a = 0:sec_cycle:(length(intensity)-1)*sec_cycle;

%loads transmissometer/ malvern data
fog01_startidx = 3938;
fog01_endidx = 5435;
addpath('C:\Users\benrd\OneDrive - The University of Texas at Austin\Desktop\Senior-Design-Shenanigans\sriram\src')
fog_data = load("C:\Users\benrd\OneDrive - The University of Texas at Austin\Desktop\Senior-Design-Shenanigans\sriram\src\files/fog_properties_20210511.mat");
fog_data.time = fog_data.time(fog01_startidx:fog01_endidx) - fog_data.time(fog01_startidx);
fog_data.LWC = fog_data.LWC(fog01_startidx:fog01_endidx);
fog_data.extinction = fog_data.extinction(fog01_startidx:fog01_endidx);
mor_vis = fog_data.MOR532(:, 1);
mor_vis = mor_vis(fog01_startidx:fog01_endidx);

mor_reldif = abs(diff(mor_vis)./mor_vis(1:end-1))*100;
intense_rel_dif = abs(diff(intensity)'./intensity(1:end-1)')*100;

mean(mor_reldif)
mean(intense_rel_dif)


%%
%====================INPUTS================%
%dLow - [1 x nlow] data set with desired time sample rate 
%                   row 1 - time

%dHigh - [2 x nhigh] data set with higher sampling rate
%                   row 1 - time
%                   row 2 - values

%===================OUTPUTS=====================%
%dHigh_new - [2 x nhigh] data set with downsampled rate to match the
%sampling rate of the lower sampling rate data set dLow
%                   row 1 - time
%                   row 2 - down sampled values







%% filter test
%{
%filtered graph
intense_filter = sgolayfilt(intensity',3,51);

figure;
yyaxis left
plot(a(1,1:end-22), intense_filter(1:end-22,1))
xlabel('time (s)')
ylabel('intensity (w/m^2)')
title('Filtered Intensity vs. Time')

% intense_fit_coef = polyfit(a(1,1:end-22), intense_filter(1:end-22),91);
% 
% intense_fit = polyval(intense_fit_coef, a(1:end-22));
% plot(a(1,1:end-22), intense_fit, 'r')
% 
% legend('filtered', 'fitted curve')
% hold off;


%%
figure;
hold on;
ylim([0 10])
grid on;
scatter(fog_data.time, 2.*ones(length(fog_data.time),1))
scatter(a, 1.95.*ones(length(a),1))
