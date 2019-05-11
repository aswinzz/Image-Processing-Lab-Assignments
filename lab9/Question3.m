%%
image = imread('morphology.tif');
A = im2double(image);

Adash  = bitcmp(A);
subplot(1,3,1);
imshow(A);
title('Original')
%% A erosion B complement

B=[1 1 0];
C=padarray(A,[0 1],1);
D=false(size(A));
for i=1:size(C,1)
    for j=1:size(C,2)-2
        L=C(i,j:j+2);

        K=find(B==1);
       if(L(K)==1)
        D(i,j)=1;
        end
    end
end
lhs = 1-D(:,:);
subplot(1,3,2);
imshow(lhs);
title('(A⊖B)^C');

%% A complement dilate B transpose

A = 1-A(:,:);
B=[1 1 0;];

C=padarray(A,[0 3]);
D=false(size(A));
for i=1:size(C,1)
    for j=1:size(C,2)-2
        D(i,j)=sum(B&C(i,j:j+2));
    end
end
subplot(1,3,3);
imshow(D);
title('A^C ⊕ˆB');