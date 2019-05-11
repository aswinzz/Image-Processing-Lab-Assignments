
close all;
clc;


test = imread('barbara.png'); 



I = test; 


[r,c] = size(I); 

% uint 8 blamk canvas
blank = uint8(zeros(r,c));


n = r*c;

% frequency pdf and cdf and some variables
f = zeros(256,1);
pdf = zeros(256,1);
cdf = zeros(256,1);
out = zeros(256,1);
cum = zeros(256,1);




for i = 1:r
    for j = 1:c
        value = I(i,j);
        f(value+1) = f(value+1)+1;
        pdf(value+1) = f(value+1)/n;
    end
end

% finding cdf
sum = 0;
L = 255;

for i = 1:size(pdf);
    sum = sum + f(i);
    cum(i) = sum;
    cdf(i) = cum(i)/n;
    out(i) = round(cdf(i)*L);
end

for i = 1:r;
    for j = 1:c;
        blank(i,j) = out(I(i,j)+1);
    end
end

figure
subplot(2,2,1)
imshow(test); title('Original image.')
subplot(2,2,2)
histogram(test); title('Original Histogram.')
 
subplot(2,2,3)
imshow(blank); title('Histogram Eq. Image ')
subplot(2,2,4);
histogram(blank); title('Histogram of the equalized image')


