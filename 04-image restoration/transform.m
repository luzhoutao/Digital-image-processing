function [ F ] = transform( image )
% transform the image to frequency domain
    F = fft2(image);
    %imshow(im2uint8(mat2gray(log(abs(F)+1))));
end

