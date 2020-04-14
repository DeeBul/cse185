function[cornerX, cornerY] = Harris_corner_detector(img, sigma1, sigma2, alpha, R_threshold)
hsize1 = 1 + 2 * ceil(sigma1 * 2);
hsize2 = 1 + 2 * ceil(sigma2 * 2);

gaussianKernel1 = fspecial('gaussian', hsize1, sigma1);
gaussianKernel2 = fspecial('gaussian', hsize2, sigma2);

Dx = [1, 0, -1];
Dy = [1; 0; -1];

Ix = imfilter(imfilter(img, gaussianKernel1, 'replicate'), Dx, 'replicate');
Iy = imfilter(imfilter(img, gaussianKernel1, 'replicate'), Dy, 'replicate');

figure, imshow(Ix);

subplot(2, 3, 1)
imshow(Ix + 0.5);

subplot(2, 3, 2)
imshow(Iy + 0.5);

Ixx = Ix .* Ix;
Iyy = Iy .* Iy;
Ixy = Ix .* Iy;

Sxx = imfilter(Ixx, gaussianKernel2, 'replicate');
Syy = imfilter(Iyy, gaussianKernel2, 'replicate');
Sxy = imfilter(Ixy, gaussianKernel2, 'replicate');

det = (Sxx .* Syy) - (Sxy .* Sxy);
trace = Sxx + Syy;
R = det - (alpha*(trace .^2));

subplot(2, 3, 3);
imagesc(R); colormap jet; colorbar; axis image;

corner_map = R > R_threshold;

subplot(2, 3, 4)
imshow(corner_map);

local_maxima = imregionalmax(R);

subplot(2, 3, 5)
imshow(local_maxima);

final_corner_map = (corner_map & local_maxima);
[cornerY, cornerX] = find(final_corner_map);
end

function p = inregionalmax(R)
shiftU = size(R, 2);
shiftV = size(R, 1);

for u = 1 + shiftU : size(R, 2) - shiftU
    for v = 1 + shiftV : size(R, 1) - shiftV
        x1 = u - floor(shiftU / 2);
        x2 = u + floor(shiftU / 2);
        y1 = v - floor(shiftV / 2);
        y2 = v + floor(shiftV / 2);
        
        p = R(y1 : y2, x1 : x2);
        
        if(R > R(shiftU - 1, shiftV - 1) && R > R(shiftU - 1, shiftV) &&  R > R(shiftU - 1, shiftV + 1) &&  R > R(shiftU + 1, shiftV - 1) && R > R(shiftU + 1, shiftV) &&  R > R(shiftU + 1, shiftV + 1) &&  R > R(shiftU, shiftV - 1) &&  R > R(shiftU, shiftV + 1)) 
        end
    end
end
end
        