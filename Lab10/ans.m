img1 = imread('img3.jpg');
img = rgb2gray(img1);
subplot(3,2,1);
imshow(img);
title('Original');

subplot(2,2,2);
imshow(img);
title("Original Image");


%% Erode
A = img;
%Structuring element
B=[1 1 0];
%Pad array with ones on both sides
C=padarray(A,[0 1],1);
%Intialize the matrix D of size A with zeros
D=false(size(A));
for i=1:size(C,1)
    for j=1:size(C,2)-2
        L=C(i,j:j+2);
 %Find the position of ones in the structuring element
        K=find(B==1);
       if(L(K)==1)
        D(i,j)=1;
        end
    end
end
subplot(2,2,3);
imshow(D);
title('Erode');
eroded = D;
A = eroded;

subplot(2,2,4);
imshow(img-A);


