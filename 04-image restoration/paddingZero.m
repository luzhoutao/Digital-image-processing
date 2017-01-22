function [ output ] = paddingZero( input )
%padding zero to the image, make it double size
    [M,N] = size(input);
    output = input;
    % 1-padding zero
    nM = M*2;
    nN = N*2;
    for r = 1:nM
        for c = 1:nN
            if(r>M || c>N)
                output(r,c) = 0;
            end
        end
    end
    imshow(im2uint8(output));
end

