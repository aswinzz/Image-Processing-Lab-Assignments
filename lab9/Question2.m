img = imread('morphology.tif');
subplot(3,2,1);
imshow(img);
title('Original');

subplot(3,3,2);
imshow(img);
title("Original Image");


%% Erode
A = img;
%Structuring element
B=[1 1 0];
%Pad array with ones on both sides
C=padarray(A,[0 1],1);
%Intialize the matrix D of size A with zeros
D=false(size(A));
for i=1:size(C,1)
    for j=1:size(C,2)-2
        L=C(i,j:j+2);
 %Find the position of ones in the structuring element
        K=find(B==1);
       if(L(K)==1)
        D(i,j)=1;
        end
    end
end
subplot(3,2,3);
imshow(D);
title('Erode');
eroded = D;

%% Dilate
A = img;
B=[1 1 1 1 1 1 1;];
C=padarray(A,[0 3]);
D=false(size(A));
for i=1:size(C,1)
    for j=1:size(C,2)-6
        D(i,j)=sum(B&C(i,j:j+6));
    end
end
subplot(3,2,4);
imshow(D);
title('Dilate');
dilated = D;

%% Open -- Erosion then Dilation
A = eroded;
B=[1 1 1 1 1 1 1;];
C=padarray(A,[0 3]);
Opened=false(size(A));
for i=1:size(C,1)
    for j=1:size(C,2)-6
        Opened(i,j)=sum(B&C(i,j:j+6));
    end
end
subplot(3,2,5);
imshow(Opened);
title('Open');

%% Close -- Dilation then Erosion
A = dilated;
%Structuring element
B=[1 1 0];
%Pad array with ones on both sides
C=padarray(A,[0 1],1);
%Intialize the matrix D of size A with zeros
D=false(size(A));
for i=1:size(C,1)
    for j=1:size(C,2)-2
        L=C(i,j:j+2);
 %Find the position of ones in the structuring element
        K=find(B==1);
       if(L(K)==1)
        D(i,j)=1;
        end
    end
end
subplot(3,2,6);
imshow(D);
title('Closed');
