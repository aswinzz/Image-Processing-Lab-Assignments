f=imread('./images/dip.tif');
subplot(3,2,1);
imshow(f);
a=size(f);
disp(a);
title('image(f)');
for x=2:a(1)-1
    for y=2:a(2)-1
        g(x,y)=f(x,y+1)+f(x,y-1)+f(x-1,y)+f(x+1,y)-4*f(x,y);
    end;
end;

for x=2:a(1)-1
    for y=2:a(2)-1
        d(x,y)=f(x,y)+g(x,y);
    end;
end;
 subplot(3,2,2);
imshow(g);
 title('higher freq components(g)');  
subplot(3,2,3);
 imshow(d)
 title('f+g');