lena_file=imread("lena.png")
imshow(lena_file)
BW = imbinarize(lena_file)
CC = bwconncomp(BW)