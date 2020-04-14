function output = median_filter(img, patch_size);
    I1 = zeros(size(img));
    IU = patch_size(2); 
    IV = patch_size(1);

    for u = 1 + IU:size(img,2) - IU
        for v = 1+IV:size(img, 1) - IV
            x1 = u - floor(IU / 2);
            x2 = u + floor(IU / 2);
            y1 = v - floor(IV / 2);
            y2 = v + floor(IV / 2);

            patch = img(y1:y2, x1:x2);
            patch = patch(:);
            val = median(patch);
            output(v, u) = val;
        end
    end
end