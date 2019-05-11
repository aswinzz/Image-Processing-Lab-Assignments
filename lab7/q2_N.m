% Reading an Image and making basic maniulations
%data=imread('cameraman.tif');
data = imread('1.jpeg');
data = imnoise(data, 'salt & pepper', 0.1);
data = im2double(data);
% Filter takes double the size of mask
masksize=2;
% Order of the filter

Q=1.5;
Q1 = -1.5;
sumn=[];
sumd=[];
pixln=0;
pixld=0;
pixln1=0;
pixld1=0;
[ro col]=size(data);
reformedimage = zeros(ro, col);
reformedimage1 = zeros(ro, col);
% Main Module for Contra Harmonic Mean Filter
for i=1:ro;
    for j=1:col;
        for m=-masksize:masksize;
            for n=-masksize:masksize;
                if (i+m>0 && i+m<ro && j+n>0 && j+n<col && ...      % To keep indices in limit
                        masksize+m>0 && masksize+m<ro && ...
                        masksize+n>0 && masksize+n<col) 
                    
                    pixl1=(data(i+m,j+n)).^(Q+1);                   % Application of Formula
                    pixl2= (data(i+m,j+n)).^Q;
                    pixl3=(data(i+m,j+n)).^(Q1+1); 
                    pixl4= (data(i+m,j+n)).^Q1;
                    pixln=pixln+pixl1;                              % Application of Summation
                    pixld=pixld+pixl2;
                    pixln1=pixln1+pixl3;
                    pixld1=pixld1+pixl4;
                
                end
            end
        end
       reformedimage(i,j)=(pixln/pixld);
       reformedimage1(i,j)=(pixln1/pixld1);
       pixln=0;
       pixld=0;
       pixln1=0;
       pixld1=0;
    end
end

subplot(3, 1, 1);
imshow(data);
subplot(3, 1, 2);
imshow(reformedimage);
subplot(3, 1, 3);
imshow(reformedimage1);