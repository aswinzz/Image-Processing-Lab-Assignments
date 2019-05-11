c = imread('flower.jpg'); 
  
% storing image information in cd 
cd = double(c); 
  
% extracting all bit one by one 
% from 1st to 8th in variable 
% from c1 to c8 respectively 
c1 = mod(cd, 2); 
c2 = mod(floor(cd/2), 2); 
c3 = mod(floor(cd/4), 2); 
c4 = mod(floor(cd/8), 2); 
c5 = mod(floor(cd/16), 2); 
c6 = mod(floor(cd/32), 2); 
c7 = mod(floor(cd/64), 2); 
c8 = mod(floor(cd/128), 2); 
  

cc = (2 * (2 * (2 * (2 * (2 * (2 * (2 * c8 + c7) + c6) + c5) + c4) + c3) + c2) + c1); 
  

subplot(3, 5, 1); 
imshow(c); 
title('Original Image'); 
  
 
subplot(3, 5, 2); 
imshow(c1); 
title('Bit Plane 8'); 
subplot(3, 5, 3); 
imshow(c2); 
title('Bit Plane 7'); 
subplot(3, 5, 4); 
imshow(c3); 
title('Bit Plane 6'); 
subplot(3, 5, 5); 
imshow(c4); 
title('Bit Plane 5'); 
subplot(3, 5, 6); 
imshow(c5); 
title('Bit Plane 4'); 
subplot(3, 5, 7); 
imshow(c6); 
title('Bit Plane 3'); 
subplot(3, 5, 8); 
imshow(c7); 
title('Bit Plane 2'); 
subplot(3, 5, 9); 
imshow(c8); 
title('Bit Plane 1'); 
  

subplot(3, 5, 10); 
imshow(uint8(cc)); 
title('Recombined Image'); 

c=1000;
img2=c7;
for row=1:size(c7,1)
    for col=1:size(c7,2)
        m=double(c7(row,col,:));
        img2(row,col,:)=c.*log10(1+m);
    end
end

subplot(3, 5, 11); 
imshow(uint8(img2)); 
title('log on 2nd plane');

img3=im2double(c8);
x=img3;
[r,c]=size(img3);
factor=1;
for i=1:r
    for j = 1:c
  x(i,j)= exp(img3(i,j)^factor)-1;
    end
end

subplot(3, 5, 13); 
imshow(uint8(img3)); 
title('Inverse log on 1st plane');


cc1 = (2 * (2 * (2 * (2 * (2 * (2 * (2 * img3 + img2) + c6) + c5) + c4) + c3) + c2) + c1); 

subplot(3, 5, 15); 
imshow(uint8(cc1)); 
title('Recombined Image');

