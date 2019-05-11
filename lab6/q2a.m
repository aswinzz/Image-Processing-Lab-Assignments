
clc;
clear all;
close all;

a = imread('cameraman.tif');

b = im2double(a);

[m,n] = size(b);
sp = rand(m,n)
b1 = zeros(m,n)
for i = 1:m
    for j = 1:n
        if sp(i,j)<0.1
            b1(i,j) = 0;
        elseif sp(i,j)>0.9
            b1(i,j) = 1;
        else
            b1(i,j) = b(i,j);
        end
    end
end
imshow(b1);title('noisy image');
c = zeros(2*m,2*n);

[p,q] = size(c);

for i = 1:p
    for j = 1:q
        if i <= m && j<= n
            c(i,j) = b1(i,j);
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
figure;imshow(e);title('2D DFT of the pre processed image');

[x,y] = freqspace(p,'meshgrid');
z = zeros(p,q);
for i = 1:p
    for j = 1:q
        z(i,j) = sqrt(x(i,j).^2 + y(i,j).^2);
    end
end


H = zeros(p,q);
for i = 1:p
    for j = 1:q
        if z(i,j) >= 0.4  
            H(i,j) = 0;
        else
            H(i,j) = 1;
        end
    end
end
figure;imshow(H);title('high Pass Filter Mask');

h1 = e.*H;
figure;
imshow(h1);title('high passed output');

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
