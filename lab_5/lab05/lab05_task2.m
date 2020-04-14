clc; clear;
I1 = im2double(imread('einstein1.jpg'));
I2 = im2double(imread('einstein2.jpg'));
template = im2double(imread('template.jpg'));

% SSD matching

threshold = 25;
[output, match] = template_matching_SSD(I1, template, threshold); %just have to change I1 to I2

figure, imshow(output ./ max(output(:))); 
figure, imshow(match);

imwrite(output ./ max(output(:)), 'SSD_matching_outputI1.jpg');
imwrite(match, 'SSD_matching_matchI1.jpg');
% 
% imwrite(output ./ max(output(:)), 'SSD_matching_outputI2.jpg');
% imwrite(match, 'SSD_matching_matchI2.jpg');

% *************************************************************************

% Normalized Cross-Correlation

threshold = 0.5;
[output, match] = template_matching_normCorr(I1, template, threshold); %just have to change I1 to I2

figure, imshow(output ./ max(output(:))); 
figure, imshow(match);

imwrite(output ./ max(output(:)), 'normcorr_matching_outputI1.jpg');
imwrite(match, 'normcorr_matching_matchI1.jpg');

% imwrite(output ./ max(output(:)), 'normcorr_matching_outputI2.jpg');
% imwrite(match, 'normcorr_matching_matchI2.jpg');






