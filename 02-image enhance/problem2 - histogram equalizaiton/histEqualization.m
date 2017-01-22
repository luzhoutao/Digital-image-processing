function [ output,T ] = histEqualization( input )
% transform the input image by histogram equalization

    histVector = imageHist(input);
    % identify the transformation function
    sum = 0;
    for i = 1:256
        sum = sum + histVector(i);
        T(i) = round(sum*255);
    end
    % get the result image
    output = uint8(T(input+1));
    
end