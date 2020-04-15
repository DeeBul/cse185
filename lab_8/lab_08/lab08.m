img1 = im2double(imread('bridge.png'));
img2 = im2double(imread('hill.png'));
img3 = im2double(imread('lines.png'));

% *******************************IMG 1 **********************************

edge_map = edge(rgb2gray(img1), 'canny', 0.1, 3);

% Cartesian 
[m,b] = hough_transform(edge_map);
x = 1 : size(img1, 2);
y = m * x + b;

subplot(2,2,1);
imshow(img1); hold on;
plot(x, y, 'LineWidth', 5, 'Color','red');
hold off;

% Polar
[r,theta] = hough_transform_polar(edge_map);
xPolar = 1 : size(img1, 2);
yPolar = -(cos(theta) / sin(theta)) * xPolar + (r / sin(theta));

subplot(2,2,3);
imshow(img1); hold on;
plot(xPolar, yPolar, 'LineWidth', 5, 'Color', 'blue');
hold off;

% *******************************IMG 2 **********************************


% edge_map = edge(rgb2gray(img2), 'canny', 0.1, 3);
% 
% %   cartesian
% [m,b] = hough_transform(edge_map);
% x = 1 : size(img2, 2);
% y = m * x + b;
% 
% subplot(2,2,1);
% imshow(img2); hold on;
% plot(x, y, 'LineWidth', 5, 'Color','red');
% hold off;
% 
% % polar
% 
% [r,theta] = hough_transform_polar(edge_map);
% xPolar = 1 : size(img2, 2);
% yPolar = -(cos(theta) / sin(theta)) * xPolar + (r / sin(theta));
% 
% subplot(2,2,3);
% imshow(img2); hold on;
% plot(xPolar, yPolar, 'LineWidth', 5, 'Color', 'blue');
% hold off;

% *******************************IMG 3 **********************************
% 
% edge_map = edge(rgb2gray(img3), 'canny', 0.1, 3);
% 
% % Cartesian 
% [m,b] = hough_transform(edge_map);
% x = 1 : size(img3, 2);
% y = m * x + b;
% 
% subplot(2,2,1);
% imshow(img3); hold on;
% plot(x, y, 'LineWidth', 5, 'Color','red');
% hold off;
% 
% % polar
% [r,theta] = hough_transform_polar(edge_map);
% xPolar = 1 : size(img3, 2);
% yPolar = -(cos(theta) / sin(theta)) * xPolar + (r / sin(theta));
% 
% subplot(2,2,3);
% imshow(img3); hold on;
% plot(xPolar, yPolar, 'LineWidth', 5, 'Color', 'blue');
% hold off;
