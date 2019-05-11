lena_file=imread("lena.bmp")
imshow(lena_file)
imwrite (lena_file, '../lena2.bmp');
imfinfo('lena2.bmp')