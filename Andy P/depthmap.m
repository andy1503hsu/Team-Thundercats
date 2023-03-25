% Andy Pottinger
% Depthmap Gen

clear 
close all force
clc

%% reading files
%pathname='C:\Users\adpot\Box\Glenn I Data\Post-Time Interpolation Data\fog16_condensed';

%addpath("C:\Users\Andy Pottinger\Downloads")
pathname='C:\Users\Andy Pottinger\Box\Glenn I Data\Post-Time Interpolation Data\fog16_condensed';
addpath(pathname);

f = dir(pathname);
csvlist=[];
for i=1:length(f)
    name=string(f(i).name);
    if(contains(name,'.csv'))
        csvlist=[csvlist;name];
    end
end
clearvars -except csvlist pathname


%% Point cloud vis 


for csviter=1575:ceil(length(csvlist)/2)
    sheet=xlsread(csvlist(csviter));
    [pc]=rotatePC(sheet(:,2:4));
    clearvars -except csvlist pathname csviter pc
    lidarname=strsplit(csvlist(csviter),'.');
    depthmapGen(25,20,pc,lidarname(1));
    clearvars -except csvlist pathname csviter
    if(mod(csviter,100)==0)
        csviter
    end
end



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
%% do depthmap
function [img] = depthmapGen(w,h,pc,fname)
%w=620;
%h=512;

ub=3.65;
bb=.7;
lb=-1.25;
rb=1.25;
pixh=(ub-bb)/(h-1);
pixw=(rb-lb)/(w-1);

hz=linspace(lb,rb,w);
vt=linspace(bb,ub,h);

img=zeros(h,w);
for c=1:w
    inbin=pc((pc(:,2)<=hz(c)+pixw/2)&(pc(:,2)>hz(c)-pixw/2),:);
    for r=1:h
        ininbin=inbin((inbin(:,3)<=vt(r)+pixh/2)&(inbin(:,3)>vt(r)-pixh/2));
        if(length(ininbin)>=1)
            img(r,c)=max(ininbin(:,1));
        end
    end
end

%fun colors
emph=1.5; %Scalar value to adjust coloring (more useful in greyscale)
imgmax=max(img(:));
img=img(:,:).*(1/emph/imgmax);

[row,col]=find(img~=0);
for i=1:length(row)
    img(row(i),col(i))=img(row(i),col(i))+(1-1/emph);
end

%img=1.-img(:,:);%inverts it

imwrite(img.*255,parula(256),strcat(fname,".tiff"));

end