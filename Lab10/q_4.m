close all;
clc;
img=imread('img3.jpg');
B=rgb2gray(img);
imshow(B)
I=double(B);

for i=1:size(I,1)-2
for j=1:size(I,2)-2
    B(i,j)=((2*I(i+2,j+1)+I(i+2,j)+I(i+2,j+2))-(2*I(i,j+1)+I(i,j)+I(i,j+2)));
end
end
imshow(B); title('Boundaries');