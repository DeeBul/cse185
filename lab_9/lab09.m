run('vlfeat-0.9.21/toolbox/vl_setup')

img1 = im2single(imread('prtn13.jpg'));
img2 = im2single(imread('prtn12.jpg'));

I1 = rgb2gray(img1);
I2 = rgb2gray(img2);

[f1,d1] = vl_sift(I1);