I0 = imread('flower.jpg');
I = I0;


[height,width, numberOfColorChannels]=size(I0);
if numberOfColorChannels > 1
  disp(numberOfColorChannels);
  I = rgb2gray(I0);
end


subplot(2,4,1)
imshow(I)
title('Original Image');

[height,width]=size(I);


NumPixel = zeros(1,256);
for i = 1:height
    for j = 1:width
        NumPixel( I(i,j) + 1 ) = NumPixel( I(i,j) + 1 ) + 1;
    end
end

subplot(2,4,2)
bar(NumPixel)
title('NumPixel');

[height,width]=size(I);


ProbPixel = zeros(1,256);
for i = 1:256
    ProbPixel(i) = NumPixel(i) / (height * width * 1.0);
end

subplot(2,4,3)
bar(ProbPixel)
title('ProbPixel');

CumuPixel = zeros(1,256);
for i = 1:256
    if i == 1
        CumuPixel(i) = ProbPixel(i);
    else
        CumuPixel(i) = CumuPixel(i-1) + ProbPixel(i);
    end
end

subplot(2,4,4);
bar(CumuPixel)
title('CumPixel');

Map = zeros(1,256);
for i = 1:256
    Map(i) = uint8(255 * CumuPixel(i)+0.5);
end
for i = 1:height
    for j = 1:width
        I(i,j)=Map(I(i,j) + 1);
    end
end


subplot(2,4,5)
imshow(I)
title('New Image')
