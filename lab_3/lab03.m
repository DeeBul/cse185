clear;clc;
img = im2double(imread('lena.jpg'));

HX = [1,2,1; 0,0,0; -1,-2,-1];
HY = [1,0,-1; 2,0,-2; 1,0,-1];


%****************************Sobel_X***************************************

% tic
% sobel_filter = sobel_filter(img, HX);
% toc
% figure, imshow(sobel_filter);

%**************************************************************************

%****************************Sobel_Y***************************************

tic
sobel_filter = sobel_filter(img, HY);
toc
figure, imshow(sobel_filter);

%**************************************************************************

HX1 = [1 1 1; 2 2 2; 1 1 1];
HX2 = [1 0 -1];

HX11 = [1,1,1; 0,0,0; -1,-1,-1];
HX22 = [1, 0, -1];

%****************************Sobel_CR**************************************

img_sobelcr = sobel_filtercr(img, HX1, HX2);
figure, imshow(img_sobelcr);

%**************************************************************************

%****************************Sobel_RC**************************************

img_sobelrc = sobel_rc(img, HX11, HX22);
figure, imshow(img_sobelrc);

%**************************************************************************

%***************************Gaussian_Filter********************************

 
hsize = 5;
sigma = 2;
 
% hsize = 9;
% sigma = 4;

img_gaussian = gaussian_filter(img, hsize, sigma);
figure, imshow(img_gaussian);
imwrite(img_gaussian, 'gaussian_9.jpg');

