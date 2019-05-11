img = imread('DIP_Original.tif');
I = im2double(img);
img1 = imread('DIP_With_noise.tif');
subplot(2,2,1);
imshow(img);
title('Original');

LEN = 150;
THETA = 135;
PSF = fspecial('motion', LEN, THETA);
blurred = imfilter(I, PSF, 'conv', 'circular');

subplot(2,2,2);
imshow(img1);
title('Original_Blurred');

subplot(2,2,3);
imshow(blurred);
title('Blurred by me');

noise_mean = 0;
noise_var = 0.0001;


estimated_nsr = noise_var / var(I(:));
wnr3 = deconvwnr(blurred, PSF, estimated_nsr);
subplot(2,2,4);
imshow(wnr3)
title('Restoration');