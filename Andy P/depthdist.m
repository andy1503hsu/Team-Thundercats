% Andy Pottinger
% Dist Gen

clear 
close all force
clc

%% reading files
pathname='C:\Users\adpot\Box\Glenn I Data\Post-Time Interpolation Data\fog16_condensed';

%addpath("C:\Users\Andy Pottinger\Downloads")
addpath(pathname);
% baseline 08
%pathname='C:\Users\Andy Pottinger\Box\Glenn I Data\Post-Time Interpolation Data\fog16_condensed';

f = dir(pathname);
csvlist=[];
for i=1:length(f)
    name=string(f(i).name);
    if(contains(name,'.csv'))
        csvlist=[csvlist;name];
    end
end
clearvars -except csvlist pathname savedata
csvlist=csvlist(1:length(csvlist)-1);

%% Point cloud vis 


for csviter=2167:length(csvlist)
    sheet=xlsread(csvlist(csviter));
    [pc]=sortrows(rotatePC(sheet(:,2:4)), 1);
    
    clearvars -except csvlist pathname csviter pc savedata
    lidarname=strsplit(csvlist(csviter),'.');
    savedata(1,csviter)=cellstr(lidarname(1));
    savedata(2:101,csviter)=num2cell(binEm(pc,.5))';
    clearvars -except csvlist pathname csviter savedata
    
end

 %% saving/applying norm
load('C:\Users\adpot\Box\Glenn I Data\Post-Time Interpolation Data\baseline08_condensed\AvgDepthDist.mat') % this is an average of the bins from all baseline lidar pts
savedata(2:101,:)=num2cell(cell2mat(savedata(2:end,:))-repmat(normvec,1,length(csvlist)));

writetable(cell2table(savedata(2:end,:),"VariableNames",savedata(1,:)),'LidarDepthDist.csv')

%% rotate
function [pc]=rotatePC(pc)
slopexy=(-1.25536-1.31034)/(43.6991-2.84322);
slopexz=(2.36886-2.89709)/(43.7263-25.4688);
angxy=atand(slopexy*.9);
angxz=atand(slopexz);
%rotate z axis
xn=pc(:,1).*cosd(angxy)+pc(:,2).*sind(angxy);
yn=pc(:,1).*-sind(angxy)+pc(:,2).*cosd(angxy);
% rotate y axis
xnn=xn.*cosd(angxz)+pc(:,3).*sind(angxz);
zn=xn.*-sind(angxz)+pc(:,3).*cosd(angxz);

pc=[xnn,yn,zn];
end


function [dd]=binEm(pc,bsize)
dd=zeros(1,100);
for i=1:100
    dd(1,i)=length(pc(pc(:,1)>=bsize*(i-1)&pc(:,1)<=bsize*i));
end

end