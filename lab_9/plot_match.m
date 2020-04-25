function plot_match(img1, img2, f1, f2, matches)

img = cat(2, img1, img2);

figure, imshow(img); hold on;

f2(1,:) = f2(1,:) + size(img1, 2);

h1 = vl_plotframe(f1(:, matches(1,:)));
h2 = vl_plotframe(f2(:, matches(1,:)));

for i = 1:size(matches,2)
    p1 = f1(1:2, matches(1, i));
    p2 = f2(1:2, matches(2, i));
    plot([p1(1), p2(1)], [p1(2), p2(2)], 'b-');
    
end

hold off;

end
