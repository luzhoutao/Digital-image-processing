function [ output ] = myIFFT2( input )
% compute IFFT by FFT
    [M,N] = size(input);
    output = conj(myFFT2(conj(input))/(M*N));
end

