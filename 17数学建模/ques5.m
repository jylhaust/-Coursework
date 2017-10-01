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
 linkNum = 1;
 powPer = powToa /linkNum;
 eucDis = 1500;
%  brandWh = commuSta(1,3)*1000;
 brandWh = 100*1000;
 volTrans = brandWh*log2(1+powPer/(rol*eucDis^2));
%  timeTransca
 %--------------plot绘图-------------------
 x = commuSta(:,1);
 y = commuSta(:,2);
 z = commuAlti'/1000;
%  scatter(x,y,20,z,'r');
%  axis([20,110,0,110]);
%  hold on;
plot(x,y,'*')
%-------------求解欧式距离------------
[I,J]=find(tril(true(72),-1));
distEuo = (sqrt((x(I)-x(J)).^2+(y(I)-y(J)).^2+(z(I)-z(J)).^2));
[dx,dy] = find(distEuo<2);
% min(distEuo)
xyz = [x,y,z];
% line1_x = [];
% line1_y = [];
% line2_ = [];
% line3 = [];
% -----------------------------------
corr = [x y z];
[idx,centr]=kmeans(corr,3); 

%最后显示聚类后的数据
figure;
c1 = 0; c2 = 0; c3 = 0;
for i=1:size(corr,1) 
    tmp = corr(i,:);
    if idx(i)==1   
         plot3(tmp(:,1),tmp(:,2),tmp(:,3),'ro');
         text(tmp(:,1)+2, tmp(:,2),tmp(:,3), num2str(i));
    elseif idx(i)==2
         plot3(tmp(:,1),tmp(:,2),tmp(:,3),'g+'); 
         text(tmp(:,1)+2, tmp(:,2),tmp(:,3), num2str(i));
    else 
         plot3(tmp(:,1),tmp(:,2),tmp(:,3),'b*'); 
         text(tmp(:,1)+2, tmp(:,2),tmp(:,3), num2str(i));
    end
    hold on;
end
title('聚类结果');
xlabel('横向坐标/km');ylabel('纵向坐标/km');zlabel('海拔高度/m');
figure();
class1 = corr(idx == 1,:);
plot3(class1(:,1),class1(:,2),class1(:,3), '-ro');
hold on;
class2 = corr(idx == 2,:);
plot3(class2(:,1),class2(:,2),class2(:,3), '-g+');
hold on;
class3 = corr(idx == 3,:);
plot3(class3(:,1),class3(:,2),class3(:,3), '-b*');
xlabel('横向坐标/km');ylabel('纵向坐标/km');zlabel('海拔高度/m');
title('无人机飞行路线图');
mean(distEuo)
% figure();
% class = corr(idx == 1,:);
% class1 = [class(:,1) class(:,2)];
% F_node = repmat(class1(1,:), [size(class1,1),1]);
% dist = sqrt(sum((F_node - class1).^2, 2));
% [~,I] = sort(dist);
% class1 = class1(I,:);
% plot3(class1(:,1),class1(:,2), '-ro');
% hold on;
% class2 = corr(idx == 2,:);
% F_node = repmat(class2(1,:), [size(class2,1),1]);
% dist = sqrt(sum((F_node - class2).^2, 2));
% [~,I] = sort(dist);
% class2 = class2(I,:);
% plot3(class2(:,1),class2(:,2),class2(:,3), '-g+');
% hold on;
% class3 = corr(idx == 3,:);
% F_node = repmat(class3(1,:), [size(class3,1),1]);
% dist = sqrt(sum((F_node - class3).^2, 2));
% [~,I] = sort(dist);
% class3 = class3(I,:);
% plot3(class3(:,1),class3(:,2),class3(:,3), '-b*');

% figure();
% x = class1(:,1);
% y = class1(:,2);
% z = class1(:,3);
% [X,Y,Z]=griddata(x,y,z,linspace(min(x),max(x))',linspace(min(y),max(y)),'v4');%插值
% mesh(X,Y,Z)%三维曲面
% hold on;
% x = class2(:,1);
% y = class2(:,2);
% z = class2(:,3);
% [X,Y,Z]=griddata(x,y,z,linspace(min(x),max(x))',linspace(min(y),max(y)),'v4');%插值
% mesh(X,Y,Z)%三维曲面
% hold on;
% x = class3(:,1);
% y = class3(:,2);
% z = class3(:,3);
% [X,Y,Z]=griddata(x,y,z,linspace(min(x),max(x))',linspace(min(y),max(y)),'v4');%插值
% mesh(X,Y,Z)%三维曲面

 