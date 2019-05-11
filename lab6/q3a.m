clc;
clear all;
close all;

a = imread('cameraman.tif');

b = im2double(a);

[m,n] = size(b);
c = zeros(m,n);
sob = fspecial('sobel')
for i = 2:m-1
    for j = 2:n-1
        c(i,j) = sob(1,1)*b(i-1,j-1)+sob(1,2)*b(i-1,j)+sob(1,3)*b(i-1,j+1)+sob(2,1)*b(i,j-1)+sob(2,2)*b(i,j)+sob(2,3)*b(i,j+1)+sob(3,1)*b(i+1,j-1)+sob(3,2)*b(i+1,j)+sob(3,3)*b(i+1,j+1);
    end
end
d = abs(c);
figure;imshow(d);title('2D DFT of the pre processed image');
e = d > 0.2*max(d(:));
figure;imshow(e);title('2D DFT of the pre processed image');