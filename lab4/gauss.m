I = imread('cameraman.tif');
Iblur = imgaussfilt(I, 2);
subplot(1,2,1)
imshow(I);
title('Original Image');
subplot(1,2,2);
imshow(Iblur);
title('Gaussian filtered image, \sigma = 2')