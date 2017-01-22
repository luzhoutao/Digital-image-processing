function [ output ] = myDFT2( input )
%compute the DFT of input matrix (2D)
    [M, N] = size(input);
    for row = 1:M
        line = input(row,:);
        output(row,:) = myDFT1(line);
    end 
    for col = 1:N
        line = output(:,col);
        output(:,col) = myDFT1(line')';
    end
end

function [ output ] = myDFT1( input )
 % compute the DFT of input array (1D horizontal)
 % brute force
    M = length(input);
    for u = 1:M
        output(u) = 0+0i;
        for x = 1:M
            output(u) = output(u) + input(x)*exp(-2i*pi*(u-1)*(x-1)/M);
        end
    end
end