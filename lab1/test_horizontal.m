img1=imread('test1.jpg');
img2=imread('test2.jpg');
[r,c]=size(img1);
[r2,c2]=size(img2);
if r>r2
    new_r=r2
    img1 = imresize(img1,[new_r c]);
else
    new_r=r
    img2 = imresize(img2,[new_r c2]);
end

img_new=zeros(new_r,max(c,c2));
for i=1:new_r
    for u=1:c
        img_new(i,u)=img1(i,u);
    end
end

for i=1:new_r
    for u=1:c2
        img_new(i,u+c)=img2(i,u);
    end
end
intth=uint8(img_new);
imshow(intth);