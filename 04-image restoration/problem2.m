image = im2single(imread('Fig0526(a)(original_DIP).tif'));
[M, N] = size(image);
% add motion blur in frequecy domain
F = transform(centralize(image));
[G, H] = addMotionBlur(F, 1, 0.1, 0.1);
imwrite(im2uint8(mat2gray(log(abs(H)+1))),'2-motion_H_r.tif');
g = centralize(real(ifft2(G)));
imwrite(im2uint8(g), '2-motion_blur.tif');

% add gaussian random noise
n = normrnd(0, 10, M, N);
%g = im2single(uint8(single(im2uint8(g))+n));
g = addSinNoise(g, 0.001, 50, 50);
imwrite(im2uint8(g), '2-motion_blur_noised.tif');

% restore the motion blurred image with random noise by wiener filter
G = transform(centralize(g));
imwrite(im2uint8(mat2gray(log(abs(G)+1))), '2-motion_noise_f.tif');
K = 0.000001;
F_r = wienerFilter(G, H, K);
imwrite(im2uint8(mat2gray(log(abs(F_r)+1))), '2-frequency_after_wiener_0.0001.tif');
f_r = centralize(real(ifft2(F_r)));
imwrite(im2uint8(f_r), '2-restore_wiener_0.0001.tif');

computePSNR(f_r, image)