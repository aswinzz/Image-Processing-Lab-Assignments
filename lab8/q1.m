img = imread('1.tif');

subplot(2,3,1);
imshow(img);
[M,N] = size(img);


F=fft2(img);
S=fftshift(log(1+abs(F)));
subplot(2,3,4);
imshow(S, []);

imgg = F;
for u=1:M
    for v=1:N
        imgg(u,v) = H(u,v) * F(u,v);
    end
end

fS=fftshift(log(1+abs(imgg)));
subplot(2,3,5);
imshow(fS, []);

imgf = ifft2(imgg);
fimgf = uint8(real(imgf));
subplot(2,3,2);
imshow(fimgf);

rimg = imgg;
for u=1:M
    for v=1:N
        rimg(u,v) = imgg(u,v)/H(u,v);
    end
end
rS = fftshift(log(1 + abs(rimg)));
rimf = ifft2(rimg);
rimf = uint8(real(rimf));
subplot(2,3,3);
imshow(rimf);
subplot(2,3,6);
imshow(rS,[]);

function y = H(u,v)
T = 1;
a = 0.1;
b = 0.1;
y = (T * sin(pi * (a*u + b*v)) * exp(-1i*(pi * (a*u + b*v)))/(pi * (a*u + b*v)));
end