clc;
%Read image, convert to gray, get size
image = imread('barbara.png');

[rows, columns, numberOfColorChannels] = size(image);
if numberOfColorChannels > 1
    image_gray = rgb2gray(image);
end

%%image_gray=rgb2gray(image); 
%%[x,y]=size(image_gray); 
%%numofpixels=size(image_gray,1)*size(image_gray,2);
 
print numofpixesl;                                                   
 
 
freq=zeros(256,1); %Count number of occurrence of each pixel
prob=zeros(256,1); %Probability of each pixel
cprob=zeros(256,1); % Cumulative probability 
 
output=zeros(256,1); 
for i=1:x
    for j=1:y
        value=image_gray(i,j);
        freq(value+1)=freq(value+1)+1;
        prob(value+1)=freq(value+1)/numofpixels;
    end
end
 
sum=0;
bins=255; 
 
 
 
for i=1:size(prob)
    sum=sum+prob(i);
    cprob(i)=sum;
    output(i)=round(cprob(i)*bins);
end
 
 
output_image=uint8(zeros(x,y));
 
for i=1:x
    for j=1:y
       output_image(i,j)=output(image_gray(i,j)+1);
    end
end
 
figure
subplot(2,2,1)
imshow(image_gray); title('Original image.')
subplot(2,2,2)
imhist(image_gray); title('Original Histogram.')
 
subplot(2,2,3)
imagesc(output_image); title('Our own Histogram Eq. Image ')
subplot(2,2,4);
imhist(output_image); title('The Histogram of the equalized image')