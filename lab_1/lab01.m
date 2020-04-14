clc;clear all;
img = imread('01.jpg');
img2 = imread('02.jpg');
img3 = imread('03.jpg');
img4 = imread('04.jpg');
img5 = imread('05.jpg');
img6 = imread('06.jpg');
%figure, imshow(img);

img_green = img;
img_green(:,:,2) = 0;
max(img_green(:,2,:))
figure, imshow(img_green);

img_gray = img;
green  = img(:,:,1);
red = img(:,:,2);
blue = img(:,:,3);
img_gray = 0.299*red + 0.587*green + 0.114*blue; 
figure, imshow(img_gray);

img_rotate = imrotate(img, 90);
figure, imshow(img_rotate);

img_crop = img(30:100, 270:300,:);
figure, imshow(img_crop);

img_flip = flip(img, 2);
figure, imshow(img_flip);

img_grid = (zeros(300 * 2 + 10, 400 * 2 + 10, 3, 'uint8'));
img_grid(1:300, 1:400, :) = img;
img_grid(301:600, 1:400, :) = img2;
img_grid(1:300, 401:800, :) = img3;
img_grid(301:600, 401:800, :) = img4;

figure, imshow(img_grid);

img5 = img5(:);
s5 = size(img5)

img6 = img6(:);
s6 = size(img6)

img5_img6 = (img5 + img6) / 2;
img5_img6 = reshape(img5_img6, 375, 1242, 3);

figure, imshow(img5_img6);





