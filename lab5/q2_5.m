grayImage = imread('img1.jpg');

subplot(1, 2, 1);
imshow(grayImage, []);
title('spectrum');

imgFFT = fft2(double(grayImage));
roundTripImage = ifft2(imgFFT);
B=uint8(roundTripImage);
subplot(1, 2, 2);
imshow(B, []);
title('image');