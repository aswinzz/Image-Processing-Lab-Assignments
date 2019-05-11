img=imread('lena.bmp')
subplot(4,1,1)
imshow(img)
[r,c]=size(img);
img_new=zeros(100,100);
for i=1:r
	for u=1:c
		img_new(i,c+1-u)=img(i,u);
	end
end
subplot(4,1,2)
intth=uint8(img_new);
imshow(intth)
subplot(4,1,3)
img2=imread('test2.jpg');
[r,c]=size(img1);
[r2,c2]=size(img2);
img1 = imresize(img1,[200 200]);
img2 = imresize(img2,[200 200]);
img_new=zeros(200,200);
for i=1:200
    for u=1:200
        img_new(i,u)=img1(i,u);
    end
end

for i=1:200
    for u=1:200
        img_new(i,u+200)=img2(i,u);
    end
end
intth=uint8(img_new);
imshow(intth);
subplot(4,1,4)
img1=imread('test1.jpg');
img2=imread('test2.jpg');
[r,c]=size(img1);
[r2,c2]=size(img2);
img1 = imresize(img1,[200 200]);
img2 = imresize(img2,[200 200]);
img_new=zeros(200,200);
for i=1:200
    for u=1:200
        img_new(i,u)=img1(i,u);
    end
end

for i=1:200
    for u=1:200
        img_new(i+200,u)=img2(i,u);
    end
end
intth=uint8(img_new);
imshow(intth);