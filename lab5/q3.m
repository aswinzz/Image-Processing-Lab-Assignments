clc;clear;
A = rgb2gray(imread('III.jpg'));
subplot(1,3,1);
imshow(A);
title('Original');
I = double(A);

sz = 3;
[m,n] = size(I);
[x,y]=meshgrid(-sz:sz,-sz:sz);

M = size(x,1)-1;
N = size(y,1)-1;

% First filter
sigma1 = 2;
expo = -(x.^2+y.^2)/(2*sigma1*sigma1);
filter1 = exp(expo)/(2*pi*sigma1*sigma1);

z1 = zeros(size(I));
I1 = padarray(I,[sz sz]);

for i = 1:m
    for j =1:n
        Temp = I1(i:i+M,j:j+M).*filter1;
        z1(i,j)=sum(Temp(:));
    end
end

% Second filter
sigma2 = 5;
expo = -(x.^2+y.^2)/(2*sigma2*sigma2);
filter2 = exp(expo)/(2*pi*sigma2*sigma2);

z2 = zeros(size(I));
I2 = padarray(I,[sz sz]);

for i = 1:m
    for j =1:n
        Temp = I2(i:i+M,j:j+M).*filter2;
        z2(i,j)=sum(Temp(:));
    end
end

result1 = z1;

result1 = uint8(result1);
subplot(1,3,2);
imshow(result1);
title('G1');

%DOG
filternet = filter1 - filter2;
result2 = zeros(size(I));
Inet = padarray(I,[sz sz]);

for i = 1:m
    for j =1:n
        Temp = Inet(i:i+M,j:j+M).*filternet;
        result2(i,j)=sum(Temp(:));
    end
end

result2 = uint8(result2);
subplot(1,3,3);
imshow(result2);
title('DOG');