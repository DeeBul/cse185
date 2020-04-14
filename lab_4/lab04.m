clear; clc;
% Task1: Split Frequency

img = im2double(imread('lena.jpg'));

ratio = 0.1;
% ratio = 0.2;

[low_pass_img, high_pass_img] = separate_frequency(img, ratio);

imwrite(low_pass_img, 'lena_low_0.1.jpg');
imwrite(high_pass_img + 0.5, 'lena_high_0.1.jpg');

% imwrite(low_pass_img, 'lena_low_0.2.jpg');
% imwrite(high_pass_img + 0.5, 'lena_high_0.2.jpg');

% *************************************************************************
% Task2: Hybrid Image

name1 = 'marilyn.jpg';
name2 = 'einstein.jpg';

img1 = im2double(imread('marilyn.jpg'));
img2 = im2double(imread('einstein.jpg'));

ratio = 0.2;

img_merged = hybrid_image(img1, img2, ratio);

% figure, imshow(img_merged);

*************************************************************************




