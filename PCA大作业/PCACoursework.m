%%
clc;clear;
data = load('PointsNormals.txt'); %�ڵ�ǰĿ¼�¶�ȡtxt����

figure(1),scatter3(data(:,1),data(:,2),data(:,3),2,'g','filled');title('ԭ��άͼ');

% [coeff,score]=pca(data);
[score,~] = PCA_Calc(data);  %������д��PCA�������д���score���Ǵ����ľ���
% �Ա���MATLAB�⺯����PCA�㷨���Լ�д��PCA�㷨�����־���պó��෴����ϵ��ԭ��δ֪
%
figure(2),scatter3(score(:,1),score(:,2),score(:,4),1.5,'g','filled');title('1,2,4άͼ');

figure(3),scatter(score(:,1),score(:,2),2,'g','filled');title('1,2άͼ');
