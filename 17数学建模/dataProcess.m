%%
clc;clear;
% allData =   xlsread('附件1 区域高程数据');
load allData.mat;
keyPoint = load('data1.txt');
commuSta = load('data2.txt');
getPos = ceil(keyPoint*1000/38.2);
% testda = allData([1,2,3;4,5,6]);
for cnt = 1:7

    getKeyAlti(cnt) = allData(getPos(cnt,1),getPos(cnt,2)); % 获得关键点的高度
% getKeyAlti(cnt) = allData(getPos(cnt,1),getPos(cnt,2)); 
end
k = 0;
[a,b] = find(allData>=4200);
overPos = [a,b];
overAlti = allData(allData>=4200);
contour();
% plot3(overPos(:,1),overPos(:,2),overAlti,'.');
% for row = 1:2775
%     for col =1:2913
%         if allData(row,col)>=3000
%             k = k+1;
%             overAlti(k,1) = col;
%             overAlti(k,2) = row;
% %             m=m+1;
%         end
%         
%     end
%     
% end
    
% getKeyAlti = allData(getPos);
% Num = [1:49,51:72]
for cnt = 1:72
    t1(cnt) = ceil(commuSta(cnt,1)*1000/38.2);
    t2(cnt) = ceil(commuSta(cnt,2)*1000/38.2);
    if t2(cnt) >ceil(110*1000/38.2);
        t2(cnt) =ceil(110*1000/38.2);
    end
    commuAlti(cnt) = allData(t1(cnt),t2(cnt)); %获得地面站的高度
   
end
% xter = find(ceil(commuSta*1000/38.2));
cols = 2913; rows = 2775;
x = linspace(0,38.2*(rows-1),rows)/1000;
y = linspace(0,38.2*(cols-1),cols)/1000;
i = 0:10:100;
j = 0:10:100;
% plot3(getPos(:,1),getPos(:,2),getKeyAlti);
% grid on;
% [xi,xj] = meshgrid(i,j);
% plot(xi,xj);
% hold on;
% plot(xi',xj');
% [xx,yy] = meshgrid(x,y);
% plot(keyPoint(:,1),keyPoint(:,2),'.','LineWidth',3.5);
% mesh(commuSta(:,2),commuSta(:,1),commuAlti);
%------------------Plot--------------------
% axis([0,100,0,100]);
% x = linspace(1,(rows),rows);
% y = linspace(1,(cols),cols);
% z = allData(xx,yy);
% mesh(y,x,allData/1000);
% mesh(y(1:100),x(1:100),allData(1:100,1:100)/1000);
% mesh(y,x,allData);
% scatter(y,x,allData/1000);