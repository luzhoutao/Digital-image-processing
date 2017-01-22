image = im2single(imread('Fig0526(a)(original_DIP).tif'));
[M, N] = size(image);
% add sin noise
A = 100;
u0 = 300;
v0 = 300;
noisedImage = addSinNoise(image, A, u0,v0);
imwrite(im2uint8(noisedImage), '1-noisedImage.tif');

%notch filter
D0 = 1.5;
i = centralize(noisedImage);
F = fft2(i);
imwrite(im2uint8(mat2gray(log(abs(F)+1))), '1-frequency_bef.tif');
[F, Notch] = notchFiltering(F, D0, u0, v0);
imwrite(im2uint8(mat2gray(log(abs(F)+1))), '1-frequency_after.tif');
imwrite(im2uint8(mat2gray(log(abs(Notch)+1))), '1-notch_filter.tif');

g = centralize(real(ifft2(F)));
imwrite(im2uint8(g), '1-result.tif');

psnr = computePSNR(image, g)