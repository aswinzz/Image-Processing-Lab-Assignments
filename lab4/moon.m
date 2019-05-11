a = rgb2gray(imread('e:\moon.png'));
lap = [1 1 1; 1 -8 1; 1 1 1];
resp = uint8(filter2(lap, a, 'same'));
sharpened = imsubtract(a, resp);
figure; 
subplot(1,3,1);imshow(a); title('Original image');
subplot(1,3,2);imshow(resp); title('Laplacian filtered image');
subplot(1,3,3);imshow(sharpened); title('Sharpened image');
