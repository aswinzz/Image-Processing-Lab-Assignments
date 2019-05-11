C = imread('1.jpeg');
C =imnoise(C, 'salt & pepper', 0.25);
% A = rgb2gray(B);
subplot(2,2,1);
imshow(C);
title('Original');

data=im2double(C);
% Filter takes double the size of mask
masksize=2;
% Specifications of the filter
d=4;
[ro col]=size(data);
temp1=[];
graber=0;
akkumulator=[];

for i=1:ro;
    for j=1:col;
        for m=-masksize:masksize;
            for n=-masksize:masksize;
                if (i+m>0 && i+m<ro && j+n>0 && j+n<col && ...      % To keep indices in limit
                        masksize+m>0 && masksize+m<ro && ...
                        masksize+n>0 && masksize+n<col) 
                    
                    temp1=[temp1 data(i+m,j+n)];
                                    
                end
            end
        end
         
        temp1=sort(temp1);
        lenth=length(temp1);
        for k=((d/2)-1):(lenth-(d/2))
            akkumulator=[akkumulator temp1(k)];
        end
        akkumulator=sum(akkumulator);
        reformedimage(i,j)=(akkumulator) / (25-d);
        
        akkumulator=[];
        temp1=[];
        
    end
end

subplot(2,2,2);
imshow(reformedimage);
title('Contra Harmonic');
