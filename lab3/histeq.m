I = imread('AE.jpg');

num=size(I,1)*size(I,2);
hist=uint8(zeros(size(I,1),size(I,2)));
freq=zeros(256,1);
prob=zeros(256,1);
probc=zeros(256,1);
cum=zeros(256,1);
output=zeros(256,1);
for i=1:size(I,1)
    for j=1:size(I,2)
        value=I(i,j);
        freq(value+1)=freq(value+1)+1;
        prob(value+1)=freq(value+1)/num;
    end
end
sum=0;
bins=255;
for i=1:size(prob)
   sum=sum+freq(i);
   cum(i)=sum;
   probc(i)=cum(i)/num;
   output(i)=round(probc(i)*bins);
end
for i=1:size(I,1)
    for j=1:size(I,2)
            hist(i,j)=output(I(i,j)+1);
    end
end
subplot(2,2,1);
imshow(I);
subplot(2,2,2)
imhist(I);

subplot(2,2,3);
imshow(hist);
subplot(2,2,4);
imhist(hist);