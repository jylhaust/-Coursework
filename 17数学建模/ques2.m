%%
clc;clear;
load allData.mat;
keyPoint = load('data1.txt');
commuSta = load('data2.txt');
getPos = ceil(keyPoint*1000/38.2);

[a,b] = find(allData>=3000);
overPos = [a,b];
[c,d] = find(allData<3000);
blowPos = [c,d];
averPos = blowPos(blowPos);
totalSpace = length(c)*(38.2/1000)^2;
sigSpace = totalSpace/30;
H = [110,0];  J = [110,55];
cols = 2913; rows = 2775;
x = linspace(0,38.2*(rows-1),rows)/1000;
y = linspace(0,38.2*(cols-1),cols)/1000;
gridX = ceil(2775*38.2/1000);
gridY = ceil(2913*38.2/1000);

i = 0:107/9:gridX;
j = 0:110/9:gridY;
[xi,xj] = meshgrid(i,j);
plot(xi,xj);
hold on;
plot(xi',xj');
[xx,yy] = meshgrid(x,y);
% figure(1)
% plot(38.2*blowPos(:,1)/1000,38.2*blowPos(:,2)/1000,'.');hold on; %% ÕÏ°­µã
% plot(H(1),H(2),'--gs',...
%     'LineWidth',2,...
%     'MarkerSize',10,...
%     'MarkerEdgeColor','g',...
%     'MarkerFaceColor',[0.5,0.5,0.5]);
% hold on;
% plot(J(1),J(2),'--gs',...
%     'LineWidth',2,...
%     'MarkerSize',10,...
%     'MarkerEdgeColor','g',...
%     'MarkerFaceColor',[0.5,0.5,0.5])
% figure(2)
% plot(38.2*overPos(:,1)/1000,38.2*overPos(:,2)/1000,'.');hold on; %% ÕÏ°­µã

