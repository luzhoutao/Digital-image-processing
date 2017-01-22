function [ output ] = powerlawTransform( input, r )
% The function is used to transform the intensity by power law

    c = 1/(max(max(input))^r);  %identify the scaling factor
    
    output = c*(input.^r);

end

