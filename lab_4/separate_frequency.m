function[low_pass_img, high_pass_img] = separate_frequency(img, ratio)

frequency_map = fft2(img);
frequency_map_shifted = fftshift(frequency_map);

H = size(img, 1);
W = size(img, 2);

y1 = (H / 2) - (ratio * H);
y2 = (H / 2) + (ratio * H);
x1 = (W / 2) - (ratio * W);
x2 = (W / 2) + (ratio * W);

mask = zeros(size(img));
mask(y1:y2, x1:x2, :) = 1;

low_frequency_map_shifted = frequency_map_shifted .* mask;
high_frequency_map_shifted = frequency_map_shifted .* (1 - mask);

low_frequency_map = ifftshift(low_frequency_map_shifted);
high_frequency_map = ifftshift(high_frequency_map_shifted);

low_pass_img = real(ifft2(low_frequency_map));
high_pass_img = real(ifft2(high_frequency_map));

end