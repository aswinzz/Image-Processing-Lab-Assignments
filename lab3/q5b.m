A=imread('./images/second.tif');
subplot(1,3,1)
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
        avg_sum=16+26+16+26+41+26+16+26+16;
        window=[16,26,16,26,41,26,16,26,16];
        inc=1;
        sum=0;
        for x=1:3
            for y=1:3
                sum=sum+(modifyA(i+x-1,j+y-1)*window(inc));
                inc=inc+1;
            end
        end
        B(i,j)=sum/avg_sum;
       
    end
end

for x=1:size(A,1)
    for y=1:size(A,2)
        B(x,y)=A(x,y)+B(x,y);
    end
end

B=uint8(B);


        
subplot(1,3,2)
imshow(B);
title('Output');