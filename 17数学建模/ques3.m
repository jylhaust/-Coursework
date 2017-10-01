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
    commuAlti(cnt) = allData(t1(cnt),t2(cnt)); %��õ���վ�ĸ߶�
 end
%  plot(commuSta(:,1),commuSta(:,2),'*');hold on; %% �ƶ�ͨ�ŵص�
%  axis([20,110,0,110]);
 
 %-----------����λ��--------------
hig = allData(ceil(106*1000/38.2),1);
H = [110,0];
plot(H(1),H(2),'--gs',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','g',...
    'MarkerFaceColor',[0.5,0.5,0.5])
hold on;
 %--------------�������------------------
 rol = 4.314*10^-10;
 dataVolu = 500*10^6;
 powToa = 5;
 linkNum = 10;
 powPer = powToa /linkNum;
 eucDis = 3000;
 brandWh = commuSta(:,3);
 volTrans = brandWh*log2(1+powPer/(rol*eucDis^2));
%  timeTrans
 %--------------plot��ͼ-------------------
 x = commuSta(:,1);
 y = commuSta(:,2);
 z = commuAlti;
 scatter(x,y,8,'r');
 axis([20,110,0,110]);
 hold on;

[X,Y,Z] = griddata(x,y,z,linspace(20,110)',linspace(0,120),'v4' );    
hold on;
title('�����ƶ��ն˵ȸ���ͼ');
xlabel('��������/km');ylabel('��������/km');
% pcolor(X,Y,Z); shading interp;
% contourf(X,Y,Z);
% figure(4),surf(X,Y,Z);
 