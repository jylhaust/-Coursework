%%
clc;clear;
load allData.mat;
keyPoint = load('data1.txt');
commuSta = load('data2.txt');
getPos = ceil(keyPoint*1000/38.2);
for cnt = 1:7
    getKeyAlti(cnt) = allData(getPos(cnt,1),getPos(cnt,2)); % 获得关键点的高度
    circle(keyPoint(cnt,1),keyPoint(cnt,2),10);              % 方圆10公里
    hold on;
% getKeyAlti(cnt) = allData(getPos(cnt,1),getPos(cnt,2)); 
end
[a,b] = find(allData>4200);
overPos = [a,b];
[a1,b1] = find(allData>4000 & allData<4200);
midPos = [a1,b1];
% overAlti = allData(allData>=4200);
plot(38.2*overPos(:,1)/1000,38.2*overPos(:,2)/1000,'.');hold on; %% 障碍点
% plot(38.2*midPos(:,1)/1000,38.2*midPos(:,2)/1000,'.');hold on; %% 障碍点
 for cnt = 1:72
    t1(cnt) = ceil(commuSta(cnt,1)*1000/38.2);
    t2(cnt) = ceil(commuSta(cnt,2)*1000/38.2);
    if t2(cnt) >ceil(110*1000/38.2);
        t2(cnt) =ceil(110*1000/38.2);
    end
    commuAlti(cnt) = allData(t1(cnt),t2(cnt)); %获得地面站的高度
 end
%  amax = max(commuAlti);
%  amin = min(commuAlti);
% plot(commuSta(:,1),commuSta(:,2),'*');hold on; %% 移动通信地点
%------------------基地位置--------------
H = [110,0];
plot(H(1),H(2),'--gs',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','g',...
    'MarkerFaceColor',[0.5,0.5,0.5])
% plot(H(1),(2),'*');hold on;

cols = 2913; rows = 2775;
x = linspace(0,38.2*(rows-1),rows)/1000;
y = linspace(0,38.2*(cols-1),cols)/1000;
% i = 0:10:100;
% j = 0:10:100;
i = 0:1.12:112;
j = 0:1.12:112;
[xi,xj] = meshgrid(i,j);
plot(xi,xj);
hold on;
plot(xi',xj');
[xx,yy] = meshgrid(x,y);
plot(keyPoint(:,1),keyPoint(:,2),'*','LineWidth',3.5); %% 七个关键点
% mesh(commuSta(:,2),commuSta(:,1),commuAlti);