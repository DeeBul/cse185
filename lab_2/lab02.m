I1 = imread('01.jpg');

% **************************forward warping*******************************
I2 = zeros(300, 400, 3, 'uint8');

for y1 = 1:300
    for x1 = 1:400
        x1I = round(cosd(45)*(x1-200) + sind(45)*(y1-150) + 200);
        y2I = round(-sind(45)*(x1-200) + cosd(45)*(y1-150) + 150);

        if(y2I >= 1 && y2I <= 300 && x1I >= 1 && x1I <= 400);
            I2(y2I, x1I, :) = I1(y1, x1, :);
    end
end
end

figure, imshow(I2);
% *************************************************************************

% **************************backward warping*******************************

I3 = zeros(300, 400, 3, 'uint8');

for y2I = 1:300
    for x2I = 1:400
        x1I = round(cos(45)*(x2I-200) - sin(45)*(y2I-150) + 200);
        y1I = round(sin(45)*(x2I-200) + cos(45)*(y2I-150) + 150);

        if(y1I >= 1 && y1I <= 300 && x1I >= 1 && x1I <= 400);
            I3(y2I, x2I, :) = I1(y1I, x1I, :);
    end
end
end

figure, imshow(I3);
% *************************************************************************

% **************************median filter**********************************

img = im2double(imread('lena_noisy.jpg'));

patch_size = [3, 3];
% patch_size = [5, 5];

img_median = median_filter(img, patch_size);
imwrite(img_median, 'median.jpg');

figure, imshow('median.jpg');
