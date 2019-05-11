img1=imread('test1.jpg')
img2=imread('test2.jpg')
[r,c]=size(img1);
img_new=zeros(512,512);
for i=1:r
	for u=1:c
		img_new(i,u)=img1(i,u);
	end
end
[r2,c2]=size(img2);
for i=1:r2
	for u=1:c2
		img_new(i+r,u)=img2(i,u);
	end
end
intth=uint8(img_new);
imshow(intth)