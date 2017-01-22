function [ output ] = centralize( input )
% make the central of frequency domain in the point (M/2, N/2)
[M, N] = size(input);
for r = 1:M
    for c = 1:N
        output(r,c) = ((-1)^(r+c))*input(r,c);
    end
end
%imshow(im2uint8(output));
end

