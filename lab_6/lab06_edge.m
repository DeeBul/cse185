img = im2double(imread('lena.jpg'));

% sobel_feature edge detection
[magnitude, orientation] = sobel_feature(img);

threshold = 0.3;
e = magnitude > threshold;

figure, imshow(magnitude); title('Magnitude');
figure, imshow(orientation); title('Orientation');

e1 = edge(img, 'Sobel');
e2 = edge(img, 'Canny');

figure, imshow(e1); title('Sobel Edge');
figure, imshow(e2); title('Canny Edge');

