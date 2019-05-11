img=imread('lena.bmp')
subplot(1,2,1)
imshow(img)
[r,c]=size(img);
img_new=zeros(r,c);
for i=1:r
	for u=1:c
		img_new(i,c+1-u)=img(i,u);
	end
end
subplot(1,2,2)
intth=uint8(img_new);
imshow(intth)