B = imread('img1.jpg');
A = rgb2gray(B);
subplot(1,2,1);
imshow(A);
title('Original');
I = double(A);

sigma = 2;
sz = 3;
[x,y]=meshgrid(-sz:sz,-sz:sz);

M = size(x,1)-1;
N = size(y,1)-1;
expo = -(x.^2+y.^2)/(2*sigma*sigma);
mulp= exp(expo)/(2*pi*sigma*sigma);

[m,n] = size(I);
Output=zeros(size(I));
I1 = padarray(I,[sz sz]);

for i = 1:m
    for j =1:n
        Temp = I1(i:i+M,j:j+M).*mulp;
        Output(i,j)=sum(Temp(:));
    end
end

Output = uint8(Output);
subplot(1,2,2);
imshow(Output);
title('Smooth')