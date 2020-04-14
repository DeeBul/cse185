img = im2double(imread("lena.jpg"));
sigma = 2.0;
hsize = 7;
scale = 5;

% Gaussian Pyramid

I = img;

output = fspecial('gaussian', hsize, sigma);

for s = 1 : scale
    
    filter = imfilter(I, output);
    imwrite(I, sprintf('Gaussian_scale%d.jpg', s));
    I = imresize(filter, 1/2);
    
%     figure, imshow(I);
    
end

% Laplacian Pyramid

for s = 1 : scale
    
    filter = imfilter(I,output);
    
    laplacianImage = I - filter;
    
    imwrite(laplacianImage + 0.5, sprintf('Laplacian_scale%d.jpg',s));
    
    I = imresize(filter, 1/2);
    
%     figure, imshow(I);


end