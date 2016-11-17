clc;clear all;
f = imread('5.jpg');
f=rgb2gray(f);
PQ = paddedsize(size(f));
D0 = 0.05*PQ(1);
HBW = hpfilter('gaussian',PQ(1),PQ(2),D0,2);
H = 0.5+2*HBW;
gbw = dftfilt(f,HBW);
% gbw = gscale(gbw); 

ghf = dftfilt(f,H);
% ghf = gscale(ghf);

ghe = histeq(ghf,256);

subplot(221);imshow(f,[]);title('Original Pic');
subplot(222);imshow(gbw,[]);title('gaussian');
subplot(223);imshow(ghf,[]);title('gaussian & boost');
subplot(224);imshow(ghe,[]);title('boost & hist');