%read the image
image = im2single(imread('Fig0441(a)(characters_test_pattern).tif'));

%padding zeros
[M,N] = size(image);
M = 2*M;
N = 2*N;
for r = 1:M
    for c = 1:N
        if(r>M/2 || c>N/2)
            image(r,c) = 0;
        end
    end
end

%multiply (-1)^(x+y)
for r = 1:M
    for c = 1:N
        image(r,c) = ((-1)^(r+c))*image(r,c);
    end
end
F = fft2(image);
spectrum = abs(F);
imwrite(im2uint8(mat2gray(log(1+spectrum))),'2_spectrum.tif');