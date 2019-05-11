grayImage = imread('img2.jpeg');

[rows, columns, numberOfColorBands] = size(grayImage);
if numberOfColorBands > 1
    grayImage = grayImage(:, :, 2);
end

subplot(3, 1, 1);
imshow(grayImage, []);
fontSize = 20;
title('image');

maskX=[-1 0 1; -2 0 2; -1 0 1];
resX=convn(grayImage,maskX);

maskY=[1 2 1; 0 0 0; -1 -2 -1];
resY=convn(grayImage,maskY);

subplot(3, 1, 2);
F=fft2(resX);
S=fftshift(log(1+abs(F)));
imshow(S,[]);
title('spectrum x');

subplot(3, 1, 3);
F=fft2(resY);
S=fftshift(log(1+abs(F)));
imshow(S,[]);
title('spectrum y');