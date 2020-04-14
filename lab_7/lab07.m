img1 = im2double(imread('baboon.png'));
img2 = im2double(imread('checkboard.png'));
img3 = im2double(imread('cameraman.png'));

sigma1 = 1;
sigma2 = 2;
alpha = 0.04;
threshold = 1e-5 * 5;

for i = 1 : 3
    if i == 1  
        [cornerX, cornerY] = Harris_corner_detector(img1, sigma1, sigma2, alpha, threshold);
        figure, imshow(img1); hold on;
        plot(cornerX, cornerY, 'ro');
        saveas(gcf, sprintf('baboon_edge.jpg'));
    end
    
    if i == 2
        [cornerX, cornerY] = Harris_corner_detector(img2, sigma1, sigma2, alpha, threshold);
        figure, imshow(img2); hold on;
        plot(cornerX, cornerY, 'ro');
        saveas(gcf, sprintf('checkerboard_edge.jpg'));
    end
    
    if i == 3     
        [cornerX, cornerY] = Harris_corner_detector(img3, sigma1, sigma2, alpha, threshold);
        figure, imshow(img3); hold on;
        plot(cornerX, cornerY, 'ro');
        saveas(gcf, sprintf('cameraman_edge.jpg'));
    end
end

