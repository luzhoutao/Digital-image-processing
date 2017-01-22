function [ histVector ] = imageHist( input )
% Obtain the histogram from the input iamge
    
    [M,N] = size(input);
    histVector = zeros(1,256);
    for x=1:M
        for y=1:N
            histVector(input(x,y)+1) = histVector(input(x,y)+1) + 1;  % culmulate the number of pixels in some intensity
        end
    end
    histVector = histVector/(M*N);
    
end

