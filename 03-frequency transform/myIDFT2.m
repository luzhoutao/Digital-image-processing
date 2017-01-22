function [ output ] = myIDFT2( input )
% compute IDFT by DFT
    [M,N] = size(input);
    output = conj(myDFT2(conj(input))/(M*N));
end

