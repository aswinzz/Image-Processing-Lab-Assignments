clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
clear;  % Erase all existing variables. Or clearvars if you want.
workspace;  % Make sure the workspace panel is showing.
format long g;
format compact;
fontSize = 14;

% Read in a standard MATLAB gray scale demo image.
folder = fileparts(which('2.png')); % Determine where demo folder is (works with all versions).
baseFileName = '2.png';
% Get the full filename, with path prepended.
fullFileName = fullfile(folder, baseFileName);
% Check if file exists.
if ~exist(fullFileName, 'file')
	% File doesn't exist -- didn't find it there.  Check the search path for it.
	fullFileName = baseFileName; % No path this time.
	if ~exist(fullFileName, 'file')
		% Still didn't find it.  Alert user.
		errorMessage = sprintf('Error: %s does not exist in the search path folders.', fullFileName);
		uiwait(warndlg(errorMessage));
		return;
	end
end
grayImage = imread(fullFileName);
[rows columns numberOfColorBands] = size(grayImage);
if numberOfColorBands > 1
	grayImage = rgb2gray(grayImage);
end
subplot(2, 3, 1);
imshow(grayImage, [0 255]);
set(gcf, 'Name', ['Results for ' fullFileName]);
title('Original Image', 'FontSize', fontSize);
set(gcf, 'units','normalized','outerposition',[0 0 1 1]); % Maximize figure.

% Add big ripples to it.
rowVector = (1 : rows)';
period = 10; % 20 rows
amplitude = 0.5; % Magnitude of the ripples.
offset = 1 - amplitude; % How much the cosine is raised above 0.
cosVector = amplitude * (1 + cos(2 * pi * rowVector / period))/2 + offset;
ripplesImage = repmat(cosVector, [1, columns]);

% Multiply the ripples by the image to get an image with periodic "noise" in it.
grayImage = ripplesImage .* double(grayImage);
subplot(2, 3, 2);
imshow(grayImage, [0 255]);
axis on;
title('Image with periodic ripples', 'FontSize', fontSize);

% Compute the 2D fft.
frequencyImage = fftshift(fft2(grayImage));
% Take log magnitude so we can see it better in the display.
amplitudeImage = log(abs(frequencyImage));
subplot(2, 3, 3);
imshow(amplitudeImage, []);
caption = sprintf('Convert to frequency domain');
title(caption, 'FontSize', fontSize);
axis on;

% Find the location of the big spikes.
amplitudeThreshold = 11.5;
brightSpikes = amplitudeImage > amplitudeThreshold; % Binary image.
subplot(2, 3, 4);
imshow(brightSpikes);
axis on;
title('Bright Spikes', 'FontSize', fontSize);

% Exclude the central DC spike.  Everything from row 115 to 143.
brightSpikes(250:350, :) = 0;
imshow(brightSpikes);
title('Bright spikes other than central spike', 'FontSize', fontSize);

% Filter/mask the spectrum.
frequencyImage(brightSpikes) = 0;
% Take log magnitude so we can see it better in the display.
amplitudeImage2 = log(abs(frequencyImage));
minValue = min(min(amplitudeImage2));
maxValue = max(max(amplitudeImage2));
subplot(2, 3, 5);
imshow(amplitudeImage2, [minValue maxValue]);
amplitudeImage2 = amplitudeImage-amplitudeImage2;
axis on;
title('Spikes zeroed out', 'FontSize', fontSize);

filteredImage = ifft2(fftshift(frequencyImage));
amplitudeImage3 = abs(filteredImage);
minValue = min(min(amplitudeImage3));
maxValue = max(max(amplitudeImage3));
%subplot(2, 3, 6);
%imshow(amplitudeImage3, [minValue maxValue]);
%title('Filtered Image', 'FontSize', fontSize);

%[r,c]=size(amplitudeImage3);
%for i=1:r
%    for j=1:c
%        if(amplitudeImage3(i,j)>25)
%            amplitudeImage3(i,j)=200;
%        end
%    end
%end
subplot(2, 3, 6);
imshow(amplitudeImage3, [minValue maxValue]);
title('Filtered Image', 'FontSize', fontSize);