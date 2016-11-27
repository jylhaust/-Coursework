function [ y,newD] = PCA_Calc(input_data )
%% ����˵��
% input_data �����ԭʼ����
%% ����ֵ˵��
% y PCA�����ľ���
% newD ��������
%% --------------------------------------------------------------
[n,~] = size(input_data);  %��ȡ��������
mdata = mean(input_data);  % ȡƽ��ֵ
Cdata =input_data-repmat(mdata,n,1); % ���Ļ�����
Cx = Cdata'*Cdata ./ n;   %   ��Э�������
[eigVec,eigD]=eig(Cx);    % ��ȡ���������ֵ����������
% ��������ľ��������ֵ�����������ǰ��յݼ�˳������
% ��������Ĳ����ǽ��ݼ���ɵ���
[newD,index] = sort(diag(eigD),'descend'); %����ֵ��������
newD=diag(newD);
newVec=eigVec(:,index);   %����������֮�໥��Ӧ
% x1 = newVec*newD*newVec';
y=newVec'*Cdata';     % PCA�õ����¾���  
y = y';
end