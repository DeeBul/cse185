function output2 = sobel_filterrc(img, HX1, HX2)

    rows = size(img, 1);
    cols = size(img, 2);
    img2 = zeros(rows+2, cols+2);
    img2(1+1:rows+1, 1+1:cols+1) = img;
    ouput = zeros(rows+2, cols+2);
    output2 = zeros(rows, cols);
    
    for i = 1:rows
        for j = 1:cols
            output(i, j:j+2) = sum(HX1.*img2(i:i+2,j:j+2), 1);
            output2(i,j) = sum(HX2.*output(i,j:j+2));
        end
    end
end
