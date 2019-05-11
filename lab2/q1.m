img=imread('flower.jpg');
img1=img;
for row=1:size(img,1)
    for col=1:size(img,2)
       img1(row,col,:)=255-img(row,col,:);
    end
end


c=100;
img2=img;
for row=1:size(img,1)
    for col=1:size(img,2)
        m=double(img(row,col,:));
        img2(row,col,:)=c.*log10(1+m);
    end
end


img3=im2double(img);
x=img3;
[r,c]=size(img3);
factor=1;
for i=1:r
    for j = 1:c
  x(i,j)= exp(img3(i,j)^factor)-1;
    end
end


img4=im2double(img);
x2=img4;
f=0.4;
cons=10;
[r,c]=size(img4);
for i=1:r
    for j=1:c
        
        x2(i,j)=cons*(img4(i,j)^f);
        
    end
end




subplot(2,3,1);imshow(img);title('input');
subplot(2,3,2);imshow(img1);title('negetive');
subplot(2,3,3);imshow(img2);title('log');
subplot(2,3,4);imshow(x);title('inverse log');
subplot(2,3,5);imshow(x2);title('gama');
