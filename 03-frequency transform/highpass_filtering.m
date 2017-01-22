image = im2single(imread('Fig0441(a)(characters_test_pattern).tif'));

D0 = [30,60,160];

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

%Fourier transform to frequency domain
F = fft2(image);

%generate the gaussian lowpass filter
for i = 1:length(D0)
    H = myGHPF(D0(i), M, N);
    
    % filter the spectrum
    G = H.*F;

    % inverse Fourier transform
    gp = real(ifft2(G));
        %multiply (-1)^(x+y)
        for r = 1:M
            for c = 1:N
                gp(r,c) = ((-1)^(r+c))*gp(r,c);
            end
        end

    %cut the padding
    g = gp(1: M/2,1: M/2);
    imwrite(im2uint8(g),sprintf('%s%d%s','4_result_',D0(i),'.tif'));
end
