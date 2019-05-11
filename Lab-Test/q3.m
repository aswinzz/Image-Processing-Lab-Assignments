

img = imread('barbara.png');
filtered = average_filter(img);
filtered = uint8(filtered);
figure
subplot(2,1,1);
imshow(img); title('input');
subplot(2,1,2);
imshow(uint8(filtered)); title('output');

function [filtered_img] = average_filter(noisy_img)
    [m,n] = size(noisy_img);
    filtered_img = zeros(m,n);
    for i = 1:m-2
        for j = 1:n-2
            filtered_img(i+1,j+1) = mean2(noisy_img(i:i+2,j:j+2));
        end
    end
end



