% % 
% % Image Processing
% % 
clc;clear all; close all;       %clear the workspace
Img_RGB=imread('C:\Users\Yuanlin\Desktop\work\8.jpg'); %read a picpure
% Img_Croped = imcrop(Img_RGB,[120,170,700,980]);%Pick the key imgage messages
Img_Croped = imcrop(Img_RGB,[165,95,780,635]);%Pick the key imgage messages
Img_Gray=rgb2gray(Img_Croped);     %RGB pic is tansfered to gray
Img_Gray = im2double(Img_Gray);    %Transfer types of variables 
% imshow(Img_RGB);
% Img_Unit8=im2uint8(mat2gray(log(1+double(Img_Croped))));
% Display the the process
% subplot(131),imshow(Img_RGB);title('Original Picture');
% subplot(132),imshow(Img_Croped);title('Croped Picture');
% subplot(133),imshow(Img_Gray);title('Grayscale Picture');
% J=imadjust(Im,[0.3 0.7],[0 1]);   %灰度调整
% Img_histeq=histeq(Img_Gray);      %均衡化
% Img_histeq = adapthisteq(Img_Croped,'NumTiles',[25 25]);

% H_Sob=fspecial('sobel');  % 预定义的滤波算子 prewitt laplacian
% %Img_Filter=filter2(Img_Gray,Img_Gray);  
% % Img_Adjusted = imadjust(Img_Gray,[0.3 0.8],[]);
H_ave=fspecial('average',3*3);
H_Lap=fspecial('laplacian',0);
W_Arr8 = [1 1 1;1 -8 1;1 1 1];
% % Img_Filter = Img_Gray-imfilter(Img_Gray,H_Lap,'replicate');
% Img_histeq=histeq(Img_Gray); 
% % Img_histeq = adapthisteq(Img_Gray,'NumTiles',[25 25]);
% Img_Adjusted = imadjust(Img_Croped,stretchlim(Img_Croped),[],0.7); %
% % % Img_histeq = adapthisteq(Img_Adjusted,'NumTiles',[10 10]);
% subplot(121),imshow(Img_Adjusted); title(' Img_Adjusted');   
% subplot(122),imshow(Img_Croped); title(' GrayPicture');   
% subplot(122),imhist(Img_Croped,256); title('ImgGray Hist');  
% subplot(121),imshow(Img_histeq); title('histeq GrayPicture');   
% subplot(122),imhist(Img_histeq,256); title('histeq Hist');   
% subplot(121),imshow(Img_Gray); title(' GrayPicture');   
% subplot(122),imshow(Img_Adjusted); title('Adjusted GrayPicture');   
% % Img_Adjusted = imadjust(Img_histeq,stretchlim(Img_histeq),[],1.2);
% subplot(121),imshow(Img_Adjusted); title('Adjusted GrayPicture');     
% subplot(122),imhist(Img_Adjusted,256);title('Adjusted Hist'); 
Img_Filter=imfilter(Img_Croped,H_ave);  
% % Img_Filter = Img_Gray-imfilter(Img_Gray,W_Arr8,'replicate');
% 
% %  Img_Filter3=imfilter(Img_Adjusted,H_ave);     % 3*3 median filter
%  Img_Filter0=medfilt2(Img_Adjusted,[5 5]);       % *5 median filter
%  Img_Filter1=medfilt2(Img_Adjusted,[7 7]);
%  Img_Filter=medfilt2(Img_Adjusted,[9 9]);   
% %  imshow(Img_Filter3);
%  subplot(131),imshow(Img_Filter0);title('5*5 Med-Filtere');
%  subplot(132),imshow(Img_Filter1);title('7*7 Med-Filter');

 Img_Filter_H = Img_Filter-imfilter(Img_Filter,H_Lap,'replicate');
 subplot(131),imshow(Img_Croped);title('Img_Croped');
 subplot(132),imshow(Img_Filter);title('9*9 Med-Filter');
 subplot(133),imshow(Img_Filter_H);title('Img_Filter_H');
%  Img_Filter_W = Img_Filter-imfilter(Img_Filter0,W_Arr8,'replicate');
% % imtool(Img_RGB);% display pixel coordinate
% subplot(121),imshow(Img_Gray);title('Original GrayPicture');
% subplot(122),imshow(Img_Filter_H);title('Processed Picture');
% subplot(131),imshow(Img_Filter);title('Med-Filterre');
% subplot(132),imshow(Img_Filter_H);title('Laplaciane-4');
% subplot(133),imshow(Img_Filter_W);title('Laplaciane-8');