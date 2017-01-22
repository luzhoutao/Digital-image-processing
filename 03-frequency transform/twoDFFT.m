%read image
image = im2single(imread('Fig0431(d)(blown_ic_crop).tif'));

%power-2
[M,N] = size(image);
M = 2^round(log(M)/log(2));
N = 2^round(log(N)/log(2));
image = imresize(image,[M,N]);
%padding zeros
nM = M*2;
nN = N*2;
for r = 1:nM
    for c = 1:nN
        if(r>M || c>N)
            image(r,c) = 0;
        end
    end
end
imwrite(im2uint8(image),'1_padding_zero.tif');

%multiply (-1)^(x+y)
for r = 1:nM
    for c = 1:nN
        image(r,c) = ((-1)^(r+c))*image(r,c);
    end
end
imwrite(im2uint8(image),'1_centralized.tif');

%Fourier transform to frequency domain
F = myFFT2(image);
imwrite(im2uint8(mat2gray(log(abs(F)+1))),'1_spectrum.tif');

%generate the gaussian lowpass filter
D0 = 20;
H = myGLPF(D0, nM, nN);
imwrite(im2uint8(H),'1_Gaussian_lowpass_filter.tif');

% filter the spectrum
G = H.*F;
imwrite(im2uint8(mat2gray(log(abs(G)+1))),'1_filtered_spectrum.tif');

% inverse Fourier transform
gp = real(myIFFT2(G));
    %multiply (-1)^(x+y)
    for r = 1:nM
        for c = 1:nN
            gp(r,c) = ((-1)^(r+c))*gp(r,c);
        end
    end
imwrite(im2uint8(gp),'1_processed_image.tif');

%cut the padding
g = gp(1:M,1:N);
imwrite(im2uint8(g),'1_final_image.tif');