%%
clc;clear;
data = load('PointsNormals.txt'); %在当前目录下读取txt数据

figure(1),scatter3(data(:,1),data(:,2),data(:,3),2,'g','filled');title('原三维图');

% [coeff,score]=pca(data);
[score,~] = PCA_Calc(data);  %调用自写的PCA函数进行处理，score就是处理后的矩阵
% 对比了MATLAB库函数的PCA算法和自己写的PCA算法，发现矩阵刚好成相反数关系，原因未知
%
figure(2),scatter3(score(:,1),score(:,2),score(:,4),1.5,'g','filled');title('1,2,4维图');

figure(3),scatter(score(:,1),score(:,2),2,'g','filled');title('1,2维图');
