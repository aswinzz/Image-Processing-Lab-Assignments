A=imread('img3.jpg');
A=rgb2gray(A);
A=im2bw(A);
B=[1 1 1 1 1 1 1;];
C=padarray(A,[0 1],1);
Erode=false(size(A));
for i=1:size(C,1)
    for j=1:size(C,2)-6
        L=C(i,j:j+6);
        K=find(B==1);
       if(L(K)==1)
        Erode(i,j)=1;
        end
    end
end
I=Erode;
imshow(A-I); 

