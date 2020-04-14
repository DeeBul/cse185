function feature = multiscale_sobel_feature(img,scale)
feature = [];

for i = 1:scale
%     [magnitude, ~] = sobel_feature(img);
    [~, orientation] = sobel_feature(img);
    
%     feature = cat(1, feature, magnitude(:));
    feature = cat(1, feature, orientation(:));
end
end