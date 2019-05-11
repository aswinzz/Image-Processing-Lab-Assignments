A=imread('./images/avg-med.tif');
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
        window=zeros(9,1);
        inc=1;
        for x=1:3
            for y=1:3
                window(inc)=modifyA(i+x-1,j+y-1);
                inc=inc+1;
            end
        end
       
        med=sort(window);
        B(i,j)=med(5);
       
    end
end

B=uint8(B);

subplot(1,3,2)
imshow(B);
title('median');


modifyA=zeros(size(A)+2);
B=zeros(size(A));


        for x=1:size(A,1)
            for y=1:size(A,2)
                modifyA(x+1,y+1)=A(x,y);
            end
        end
       
for i= 1:size(modifyA,1)-2
    for j=1:size(modifyA,2)-2
        window=zeros(9,1);
        inc=1;
        for x=1:3
            for y=1:3
                window(inc)=modifyA(i+x-1,j+y-1);
                inc=inc+1;
            end
        end
       
        sum=0;
        for x=1:9
            sum=sum+window(x);
        end
        B(i,j)=sum/9.0;
       
    end
end

B=uint8(B);

subplot(1,3,3)
imshow(B);
title('average');