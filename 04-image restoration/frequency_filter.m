function [output] = frequency_filter(input, H)
    [M,N] = size(input);
    % 1-padding zero
    nM = M*2;
    nN = N*2;
    for r = 1:nM
        for c = 1:nN
            if(r>M || c>N)
                input(r,c) = 0;
            end
        end
    end
    % 2-centralization
    for r = 1:nM
        for c = 1:nN
            input(r,c) = ((-1)^(r+c))*input(r,c);
        end
    end
    % 3-transform to frequency domain
    F = fft2(input);
    
    % 4-filter in frequency domain
    G = H.*F;
    
    % 5-transform back to spatial domain
    gp = real(ifft2(G));
    
    % 6-decentralization
    for r = 1:nM
        for c = 1:nN
            gp(r,c) = ((-1)^(r+c))*gp(r,c);
        end
    end
    
    % 6-cut the image
    output = gp(1:M,1:N);
end