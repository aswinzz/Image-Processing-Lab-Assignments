B = imread('1.jpeg');
B =imnoise(B, 'salt & pepper', 0.25);
% A = rgb2gray(B);
subplot(2,2,1);
imshow(B);
title('Original');
I = double(B);

im=I;
n=3;
a=1;
show=1;

% check if image is grayscale
if (length(size(im)) > 2 )
   error('The image should be gray-scale');
end

if (a > floor(n^2/2))
   error('Alpha is too big for the mask size');
end

[rows, cols]=size(im);
out_im=double(im);
b_len=n^2;    % number of elements in the block

% we dont do filtering on margins
marg=(n-1)/2;

for i=1+marg:rows-marg
   for j=1+marg:cols-marg
      block=im(i-marg:i+marg,j-marg:j+marg);
      sorted=sort(reshape(block,1,b_len));
      selected=sorted(a+1:b_len-a);
      out_im(i,j)=mean(selected);
   end
end

out_im=uint8(out_im);
if (show == 1)
   subplot(2,2,2);
   imshow(out_im);
   title('Output alpha trimmed filtered image');
end


A=out_im;
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

subplot(2,2,3)
imshow(B);
title('IMAGE AFTER MEDIAN FILTERING');

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

subplot(2,2,4)
imshow(B);
title('IMAGE AFTER MEAN FILTERING');

