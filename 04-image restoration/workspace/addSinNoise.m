function [ output_s ] = addSinNoise( input_s, A, u0, v0 )
% add the sin noise to the input image
% with the form of n(x,y) = Asin(2pi(u0x/M+v0y/N))
    [M, N] = size(input_s);
    for i=1:M
        for j=1:N
            output_s(i,j) = input_s(i, j) + A*sin(2*pi*(u0*i/M + v0*j/N));
        end
    end
end
