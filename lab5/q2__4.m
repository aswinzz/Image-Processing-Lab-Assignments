grayImage = imread('img2.jpeg');

[rows, columns, numberOfColorBands] = size(grayImage);
if numberOfColorBands > 1
    grayImage = grayImage(:, :, 2);
end

subplot(2, 1, 1);
imshow(grayImage, []);
fontSize = 20;
title('image');

subplot(2, 1, 2);
F=fft2(grayImage);
S=fftshift(log(1+abs(F)));
imwrite(S,'sample.tif');
imshow(S,[]);
title('spectrum');