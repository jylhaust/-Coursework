function [ y,newD] = PCA_Calc(input_data )
%% 参数说明
% input_data 输入的原始数据
%% 返回值说明
% y PCA处理后的矩阵
% newD 特征向量
%% --------------------------------------------------------------
[n,~] = size(input_data);  %获取矩阵组数
mdata = mean(input_data);  % 取平均值
Cdata =input_data-repmat(mdata,n,1); % 中心化处理
Cx = Cdata'*Cdata ./ n;   %   求协方差矩阵
[eigVec,eigD]=eig(Cx);    % 获取矩阵的特征值与特征向量
% 以上求出的矩阵的特征值和特征向量是按照递减顺序排列
% 所以下面的步骤是将递减变成递增
[newD,index] = sort(diag(eigD),'descend'); %特征值降序排列
newD=diag(newD);
newVec=eigVec(:,index);   %特征向量随之相互对应
% x1 = newVec*newD*newVec';
y=newVec'*Cdata';     % PCA得到的新矩阵  
y = y';
end