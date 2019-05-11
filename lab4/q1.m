A=imread('./images/embedded_square_noisy.tif');
g=histeq(A,256);
subplot(1,3,1);
imshow(A);
title('IMAGE');
subplot(1,3,2)
imshow(g);
title('GLOBAL');

f=A;
f=im2double(f);
w=3;
k=1;
M=mean2(f);
z=colfilt(f,[w w],'sliding',@std);
m=colfilt(f,[w w],'sliding',@mean);
A=k*M./z;
g=A.*(f-m)+m;
subplot(1,3,3)
imshow(g);
title('LOCAL');