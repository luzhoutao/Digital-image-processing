function [ image ] = reverse( freq )
% reverse from the frequency domain to the spatial domain
    [M, N] = size(freq);
    gp = real(ifft2(freq));
    %multiply (-1)^(x+y) de-centralization
    for r = 1:M
        for c = 1:N
            gp(r,c) = ((-1)^(r+c))*gp(r,c);
        end
    end

    %cut the padding
    image = gp(1:M/2,1:N/2);
    imshow(im2uint8(image));
end

