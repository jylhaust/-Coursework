%% -------------------------------------
clc;clear;
load allData.mat;
% keyPoint = load('data1.txt');
commuSta = load('data2.txt');
% getPos = ceil(keyPoint*1000/38.2);
 for cnt = 1:72
    t1(cnt) = ceil(commuSta(cnt,1)*1000/38.2);
    t2(cnt) = ceil(commuSta(cnt,2)*1000/38.2);
    if t2(cnt) >ceil(110*1000/38.2);
        t2(cnt) =ceil(110*1000/38.2);
    end
    commuAlti(cnt) = allData(t1(cnt),t2(cnt)); %获得地面站的高度
 end
%  plot(commuSta(:,1),commuSta(:,2),'*');hold on; %% 移动通信地点
%  axis([20,110,0,110]);
 
 %-----------基地位置--------------
hig = allData(ceil(106*1000/38.2),1);
H = [110,0];
plot(H(1),H(2),'--gs',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','g',...
    'MarkerFaceColor',[0.5,0.5,0.5])
hold on;
 %--------------传输计算------------------
 rol = 4.314*10^-10;
 dataVolu = 500*10^6;
 powToa = 5;
 linkNum = 10;
 powPer = powToa /linkNum;
 eucDis = 3000;
 brandWh = commuSta(:,3);
 volTrans = brandWh*log2(1+powPer/(rol*eucDis^2));
%  timeTrans
 %--------------plot绘图-------------------
 x = commuSta(:,1);
 y = commuSta(:,2);
 z = commuAlti;
 scatter(x,y,8,'r');
 axis([20,110,0,110]);
 hold on;

[X,Y,Z] = griddata(x,y,z,linspace(20,110)',linspace(0,120),'v4' );    
hold on;
title('地面移动终端等高线图');
xlabel('横向坐标/km');ylabel('纵向坐标/km');
% pcolor(X,Y,Z); shading interp;
% contourf(X,Y,Z);
% figure(4),surf(X,Y,Z);
 