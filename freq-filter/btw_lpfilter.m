clc; clear all;

f = imread('4.jpg');
f = rgb2gray(f);
PQ = paddedsize(size(f));

D0 = [30 , 80, 200]; % µÍÍ¨ÂË²¨°ë¾¶ÊÇ D0
D1 = [15  30  80]; % ¸ßÍ¨ÂË²¨°ë¾¶ÊÇ D1
for i = 1 : 3
    H( :, :, i) = lpfilter('btw', PQ(1), PQ(2), D1(i)); % ideal gaussian btw
    g(:, :, i) = dftfilt(f, H(:, :, i));
end
subplot(221); imshow(f, []); title('Original Pic');
subplot(222); imshow(g(:, :, 1), []); title('btw D0=30');
subplot(223); imshow(g(:, :, 2), []); title('btw D0=50');
subplot(224); imshow(g(:, :, 3), []); title('btw D0=200');
% subplot(221); imshow(f, []); title('Original Pic');
% subplot(222); imshow(g(:, :, 1), []); title('btw D1=15');
% subplot(223); imshow(g(:, :, 2), []); title('btw D1=30');
% subplot(224); imshow(g(:, :, 3), []); title('btw D1=80');