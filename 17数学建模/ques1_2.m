%%
clc;clear;
load allData.mat;
keyPoint = load('data1.txt');
commuSta = load('data2.txt');
getPos = ceil(keyPoint*1000/38.2);

flyAlti = 4200;
[a,b] = find(allData<4000);
overPos = [a,b];
cs = length(a)*(38.2/1000)^2;
[a1,b1] = find(allData>4000 & allData<4200);
midPos = [a1,b1];
aimDstc = allData(allData<=4200);
avrgAlti = mean(aimDstc);
coverWh = 2*(flyAlti-avrgAlti)/tan(pi/3);
plot(38.2*overPos(:,1)/1000,38.2*overPos(:,2)/1000,'.');hold on; %% 障碍点
plot(38.2*midPos(:,1)/1000,38.2*midPos(:,2)/1000,'.');hold on; %% 障碍点
cols = 2913; rows = 2775;
x = linspace(0,38.2*(rows-1),rows)/1000;
y = linspace(0,38.2*(cols-1),cols)/1000;

gridX = ceil(2775*38.2/1000);
gridY = floor(2913*38.2/1000);

i = 0:coverWh*2/1000:gridX;
j = 0:coverWh*2/1000:gridY;
[xi,xj] = meshgrid(i,j);
plot(xi,xj,'k');
hold on;
plot(xi',xj','k');
[xx,yy] = meshgrid(x,y,'k');
% overAlti = allData(allData>=4200);
% plot(38.2*overPos(:,1)/1000,38.2*overPos(:,2)/1000,'.');hold on; %% 障碍点
% plot(38.2*midPos(:,1)/1000,38.2*midPos(:,2)/1000,'.');hold on; %% 障碍点
%------------------基地位置--------------
H = [110,0];
plot(H(1),H(2),'--gs',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','g',...
    'MarkerFaceColor',[0.5,0.5,0.5])

