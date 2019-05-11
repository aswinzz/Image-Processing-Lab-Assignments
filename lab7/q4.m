clc;
clear all;
close all;
I=imread('aerial_periodic.jpg');
Im=medfilt2(I,[11 11]);
Iam = adaptive(Im, 11);

subplot(1,2,1);
imshow(I);
title('Original');

subplot(1,2,2);
imshow(Iam);
title('Output');
