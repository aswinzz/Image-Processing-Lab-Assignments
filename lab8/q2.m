% Demo to filter an image, with periodic ripple, in the Fourier domain.
clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
clear;  % Erase all existing variables. Or clearvars if you want.
workspace;  % Make sure the workspace panel is showing.
format long g;
format compact;
fontSize = 14;


fullFileName = '2.png'
grayImage = imread('2.png');
[rows columns numberOfColorBands] = size(grayImage);
if numberOfColorBands > 1
	grayImage = rgb2gray(grayImage);
end
subplot(2, 3, 1);
imshow(grayImage, [0 255]);
set(gcf, 'Name', ['Results for ' fullFileName]);
title('Original Image', 'FontSize', fontSize);
set(gcf, 'units','normalized','outerposition',[0 0 1 1]); % Maximize figure.

% Compute the 2D fft.
frequencyImage = fftshift(fft2(grayImage));
% Take log magnitude so we can see it better in the display.
amplitudeImage = log(abs(frequencyImage));
minValue = min(min(amplitudeImage))
maxValue = max(max(amplitudeImage))
subplot(2, 3, 2);
imshow(amplitudeImage, []);
caption = sprintf('Notice the two spikes\nperpendicular to the periodic frequency');
title(caption, 'FontSize', fontSize);
axis on;
% zoom(10)

% Find the location of the big spikes.
amplitudeThreshold = 10.9;
brightSpikes = amplitudeImage > amplitudeThreshold; % Binary image.
subplot(2, 3, 4);
imshow(brightSpikes);
axis on;
title('Bright Spikes', 'FontSize', fontSize);
% Let user see the image.

% Exclude the central DC spike.  Everything from row 115 to 143.
brightSpikes(115:143, :) = 0;
imshow(brightSpikes);
title('Bright spikes other than central spike', 'FontSize', fontSize);

% Filter/mask the spectrum.
frequencyImage(brightSpikes) = 0;
% Take log magnitude so we can see it better in the display.
amplitudeImage2 = log(abs(frequencyImage));
minValue = min(min(amplitudeImage2))
maxValue = max(max(amplitudeImage2))
subplot(2, 3, 5);
imshow(amplitudeImage2, [minValue maxValue]);
axis on;
title('Spikes zeroed out', 'FontSize', fontSize);
% zoom(10)

filteredImage = ifft2(fftshift(frequencyImage));
amplitudeImage3 = abs(filteredImage);
minValue = min(min(amplitudeImage3))
maxValue = max(max(amplitudeImage3))
subplot(2, 3, 6);
imshow(amplitudeImage3, [minValue maxValue]);
title('Filtered Image', 'FontSize', fontSize);
% set(gcf, 'units','normalized','outerposition',[0 0 1 1]); % Maximize figure.
% % 