clc;
clear all;
close all;
I=imread('2.jpg');
I = rgb2gray(I);
In=imnoise(I,'salt & pepper',0.50);
Im=medfilt2(In,[7 7]);
Iam = adaptive(In, 7);

subplot(1,5,1);
imshow(I);
title('Original');

subplot(1,5,2);
imshow(In);
title('Salt and Pepper');


subplot(1,5,3);
imshow(Iam);
title('7*7 adaptive');

Im=medfilt2(In,[3 3]);
Iam = adaptive(In, 3);

subplot(1,5,4);
imshow(Iam);
title('3*3 adaptive');

Im=medfilt2(In,[9 9]);
Iam = adaptive(In, 9);

subplot(1,5,5);
imshow(Iam);
title('9*9 adaptive');