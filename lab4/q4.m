A=imread('./images/moon.tif');
subplot(1,5,1)
imshow(A);
title('IMAGE');

modifyA=zeros(size(A)+2);
B=zeros(size(A));


        for x=1:size(A,1)
            for y=1:size(A,2)
                modifyA(x+1,y+1)=A(x,y);
            end
        end
       
for i= 1:size(modifyA,1)-2
    for j=1:size(modifyA,2)-2
        window=[0,1,0,1,-4,1,0,1,0];
        inc=1;
        sum=0;
        for x=1:3
            for y=1:3
                sum=sum+(modifyA(i+x-1,j+y-1)*window(inc));
                inc=inc+1;
            end
        end
        B(i,j)=sum;
       
    end
end

B=uint8(B);

subplot(1,5,2)
imshow(B);
title('MASK1');


B=zeros(size(A));
for i= 1:size(modifyA,1)-2
    for j=1:size(modifyA,2)-2
        window=[1,1,1,1,-8,1,1,1,1];
        inc=1;
        sum=0;
        for x=1:3
            for y=1:3
                sum=sum+(modifyA(i+x-1,j+y-1)*window(inc));
                inc=inc+1;
            end
        end
        B(i,j)=sum;
       
    end
end

B=uint8(B);

subplot(1,5,3)
imshow(B);
title('MASK2');


B=zeros(size(A));
for i= 1:size(modifyA,1)-2
    for j=1:size(modifyA,2)-2
        window=[0,-1,0,-1,4,-1,0,-1,0];
        inc=1;
        sum=0;
        for x=1:3
            for y=1:3
                sum=sum+(modifyA(i+x-1,j+y-1)*window(inc));
                inc=inc+1;
            end
        end
        B(i,j)=sum;
       
    end
end

B=uint8(B);

subplot(1,5,4)
imshow(B);
title('MASK3');

B=zeros(size(A));
for i= 1:size(modifyA,1)-2
    for j=1:size(modifyA,2)-2
        window=[-1,-1,-1,-1,8,-1,-1,-1,-1];
        inc=1;
        sum=0;
        for x=1:3
            for y=1:3
                sum=sum+(modifyA(i+x-1,j+y-1)*window(inc));
                inc=inc+1;
            end
        end
        B(i,j)=sum;
       
    end
end

B=uint8(B);

subplot(1,5,5)
imshow(B);
title('MASK4');