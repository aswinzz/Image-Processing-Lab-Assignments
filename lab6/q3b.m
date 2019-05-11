
clc;
clear all;
close all;

a = imread('cameraman.tif');

b = im2double(a);

[m,n] = size(b);

c = zeros(2*m,2*n);

[p,q] = size(c);

for i = 1:p
    for j = 1:q
        if i <= m && j<= n
            c(i,j) = b(i,j);
        else
            c(i,j) = 0;
        end
    end
end
imshow(b);title('original image');
figure;
imshow(c);title('padded image');


d = zeros(p,q);

for i = 1:p
    for j = 1:q
        d(i,j) = c(i,j).*(-1).^(i + j);
    end
end
figure;
imshow(d);title('pre processed image for calculating DFT');

e = fft2(d);
sob = fspecial('sobel')
sob1 = fft2(sob,p,q)

figure;imshow(e);title('2D DFT of the pre processed image');

[x,y] = freqspace(p,'meshgrid');
z = zeros(p,q);
for i = 1:p
    for j = 1:q
        z(i,j) = sqrt(x(i,j).^2 + y(i,j).^2);
    end
end

figure;imshow(sob1);title('Low Pass Filter Mask');

h1 = e.*sob1;
figure;
imshow(h1);title('Low passed output');


h2 = ifft2(h1);
figure;
imshow(h2);title('output image after inverse 2D DFT');

h3 = zeros(p,q);
for i = 1:p
    for j = 1:q
        h3(i,j) = h2(i,j).*((-1).^(i+j));
    end
end
figure;
imshow(h3);title('Post Processed image');

out = zeros(m,n);
for i = 1:m
    for j = 1:n
        out(i,j) = h3(i,j);
    end
end
figure;
imshow([b out]);title('input image                 output image');
out1 = abs(out);
figure;imshow(out1);title('2D DFT of the pre processed image');
out2 = out1 > 0.2*max(out1(:));
figure;imshow(out2);title('2D DFT of the pre processed image');
