function output = gaussian_filter(img, hsize, sigma)
    H = fspecial('gaussian', hsize, sigma);
    
    output = zeros(size(img));
    x = size(H, 2);
    y = size(H, 1);
    
    for u = 1+x: size(img, 2) - x
        for v = 1+y: size(img, 1)-y
            x1 = u - floor(x/2);
            x2 = u + floor(x/2);
            y1 = v - floor(y/2); 
            y2 = v + floor(y/2);
            
           patch = img(y1:y2, x1:x2); 
           patch = patch .* H;
           patch = patch(:);
           
           value = sum(patch);
           value = sum(value);
           
           output(v, u) = value;
           
        end
    end
end
