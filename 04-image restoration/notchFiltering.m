function [ output_f, Notch ] = notchFiltering( input_f, D0, u0, v0 )
% construct the notch filter and filter the input image in frequency domain
    [M, N] = size(input_f);
    u1 = M/2 - u0;
    v1 = N/2 - v0;
    u0 = M/2 + u0;
    v0 = N/2 + v0;
    %generate the notch filter
    for i = 1:M
        for j = 1:N
            if(((i-u0)^2+(j-v0)^2)^(1/2)<=D0 || ((i-u1)^2+(j-v1)^2)^(1/2)<=D0)
                Notch(i, j) = 0;
            else
                Notch(i, j) = 1;
            end
        end
    end
    output_f = input_f.*Notch;
end

