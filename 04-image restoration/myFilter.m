function [ output_freq ] = myFilter( freq, filter )
% filter in the frequency domain
    output_freq = freq.*filter;
    imshow(im2uint8(mat2gray(log(abs(output_freq)+1))));
end

