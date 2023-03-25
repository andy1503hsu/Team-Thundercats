% Andy Pottinger
% Random Senior Design Stuff

clear 
close all force
clc

%% Point cloud vis 
pathname='C:\Users\adpot\Box\Glenn I Data\Post-Time Interpolation Data\fog16_condensed';
addpath(pathname);
%addpath("C:\Users\Andy Pottinger\Downloads")
% baseline 08
sheet=xlsread("Lidar10.csv");

x=sheet(:,2);
y=sheet(:,3);
z=sheet(:,4);
t=sheet(:,8);
difft=diff(t);

% rotate
slopexy=(-1.25536-1.31034)/(43.6991-2.84322);
slopexz=(2.36886-2.89709)/(43.7263-25.4688);
angxy=atand(slopexy*.9);
angxz=atand(slopexz);
%rotate z axis
xn=x.*cosd(angxy)+y.*sind(angxy);
yn=x.*-sind(angxy)+y.*cosd(angxy);

xnn=xn.*cosd(angxz)+z.*sind(angxz);
zn=xn.*-sind(angxz)+z.*cosd(angxz);
xn=xnn;

plotbigboy(xn,yn,zn)

%% cleanup cool way

pc=pointCloud([xn,yn,zn]);
[pcn,in,out]=pcdenoise(pc,'Threshold',.1,'NumNeighbors',5);

in=pc.Location(in,:);
out=pc.Location(out,:);

figure 
hold on
scatter3(in(:,1),in(:,2),in(:,3),'b');
scatter3(out(:,1),out(:,2),out(:,3),'r');
hold off


%% cleanup bs way

figure
hold on
scatter3(xn,yn,zn,'.')
%scatter3(x10,y10,z10,'.')
view(90,0);

%% voxel
xyz=[xn,yn,zn];
voxelsize=0.1;
for i=1:3
    tmp=xyz(:,i);
    edges=min(tmp):voxelsize:max(tmp)+voxelsize;
    xyz(:,i)=discretize( tmp , edges);
end
V=accumarray(xyz,1)>0;
volumeViewer(V);
%scatter3(xyz(:,1),xyz(:,2),xyz(:,3),'.','Alpha',.1)



%%
x=randn(100,1);y=randn(100,1);  % sample data
scatter(x,y,20*abs(y),y,'filled')
colormap(hsv)

%% depthmap
w=620;
h=512;

ub=3.65;
bb=.7;
lb=-1.25;
rb=1.25;
pixh=(ub-bb)/(h-1);
pixw=(rb-lb)/(w-1);

hz=linspace(lb,rb,w);
vt=linspace(bb,ub,h);

pc=[xn yn zn];
img=zeros(h,w);
for r=1:w
    inbin=pc((pc(:,2)<=hz(r)+pixw/2)&(pc(:,2)>hz(r)-pixw/2));
    for c=1:h
        inbin=inbin((inbin(:,3)<=vt(c)+pixh/2)&(inbin(:,3)>vt(c)+pixh/2));
        img(c,r)=length(inbin);
    end
end


%% testing the delanauy stuff for shits n gigs
% 
% DT = delaunay(x,y); triplot(DT,x,y); figure scatter(x,y,'.')
% 

%%

plotbigboy(x,y,z);

plotbigboy(xn,yn,zn);
%%
figure
hold on
scatter3(xn(:),yn(:),zn(:),'.');
xlabel('x');
ylabel('y');
zlabel('z');

binsize=3;

for i=0:binsize:42
fill3([i i i i], [-2 2 2 -2], [4 4 -2 -2],'r','FaceAlpha','.3')
end
%%
binsize=3;

sheetbydepth=sortrows(sheet, 2);
npoints=[];
for i=0:binsize:42
selected=sheetbydepth(sheetbydepth(:,2)>i & sheetbydepth(:,2)<i+2 , :);
npoints=[npoints length(selected)];
figure
scatter(selected(:,3),selected(:,4),'.');

end
%%
figure
hold on
yyaxis left
hist(sheetbydepth(:,2),100)
yyaxis right
hold on
pd = fitdist(sheetbydepth(:,2),'Weibull');
plot(0:.1:40,pdf(pd,0:.1:40))
pd = fitdist(sheetbydepth(:,2),'Logistic');
plot(0:.1:40,pdf(pd,0:.1:40))   
pd = fitdist(sheetbydepth(:,2),'Normal');
plot(0:.1:40,pdf(pd,0:.1:40))   
pd = fitdist(sheetbydepth(:,2),'Poisson');
plot(0:.1:40,pdf(pd,0:.1:40))   
legend('Num Points','Weibull','Logistic','Normal','Poisson');
%%
selected=sheetbydepth(sheetbydepth(:,2)>2.12 & sheetbydepth(:,2)<2.62 , :);
npoints=[npoints length(selected)];
figure
scatter(selected(:,3),selected(:,4),'.');
%%
% %% Monte Carlo solvspd=1e12; pts=120000; usepct=unid(.1,.8,100);
% mops=unid(pts/2,5*pts,100); dt=normd(740000,2300,100);
% 
% combs= combvec(usepct',mops',dt')'; rt=zeros(length(combs),1); for
% i=1:length(combs)
%     rt(i)=1/solvspd.*((combs(i,1).*1979).*(combs(i,2).*combs(i,3)));
%     
% end figure histogram(rt,[0,100,200,300,400,500,600,700,800])
% xlabel('Runtime (s)') title('Model Runtime Distribution')
% 
% figure cdfplot(rt) %% Functions function [x]=normd(v,s,n) x =
% v+(s*randn(n,1)); end function [x]=normd2(mi,ma,n) v = randn(n,1); x = mi
% + (ma-mi).*((v-min(v))./(max(v)-min(v))); end function [x]=unid(mi,ma,n)
% v = rand(n,1); x = mi + (ma-mi).*v; end
% 


%%
function plotbigboy(x,y,z)
figure
subplot(2,2,1)
scatter3(x(:),y(:),z(:),'.');
title('Top View')
view(0,90)
xlabel('x');
ylabel('y');
zlabel('z');

subplot(2,2,2)
scatter3(x(:),y(:),z(:),'.');
title('Side View')
view(0,0)
xlabel('x');
ylabel('y');
zlabel('z');

subplot(2,2,3)
scatter3(x(:),y(:),z(:),'.');
title('Front View')
view(90,0)
xlabel('x');
ylabel('y');
zlabel('z');

subplot(2,2,4)
scatter3(x(:),y(:),z(:),'.');
title('3D View')
xlabel('x');
ylabel('y');
zlabel('z');



end







     