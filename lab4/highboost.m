f=imread('./images/dip.tif');
figure
imshow(f);
a=size(f);
disp(a);
title('org=f');
for x=2:449
    for y=2:599
        g(x,y)=f(x,y+1)+f(x,y-1)+f(x-1,y)+f(x+1,y)-4*f(x,y);
        %g(x,y)=-f(x,y+1)-f(x,y-1)-f(x-1,y)-f(x+1,y)+4*f(x,y);
        %g(x,y)=f(x-1,y-1)+f(x-1,y)+f(x-1,y+1)+f(x,y-1)-8*f(x,y)+f(x,y+1)+f(x+1,y-1)+f(x+1,y)+f(x+1,y+1);
       
    end;
end;
for x=2:449
    for y=2:599
d(x,y)=f(x,y)+g(x,y);
    end;
end;
 figure
imshow(g);
 title('chngd=g  i.e. edges =>  higher freq components');  
figure
 imshow(d)
 title('f+g i.e. modified=org+edges ');