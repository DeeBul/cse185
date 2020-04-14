function [magnitude, orientation] = sobel_feature(img)

Hy = [1, 2, 1; 0, 0, 0; -1, -2, -1];
Hx = [1, 0, -1; 2, 0, -2; 1, 0, -1 ];

sobelX = imfilter(img, Hx);
sobelY = imfilter(img, Hy);

magnitude = sqrt((sobelX).^2 + (sobelY).^2); % when doing squared put . before karat
orientation = atan2(sobelY, sobelX);

end