function [ output ] = logTransform( input )
%log transformation with the general form as s=clog(r+1)

    c = 1/log(1+max(max(input)));   %identify the scaling factor
    
    output = c*log(1+input);
    
end

