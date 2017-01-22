function [ output, scaledUnsharp, blurredInput ] = UnsharpFiltering( input, boxMask, scale )
% implement unsharp masking or highboost filtering 

    blurredInput = spatialFiltering(input, boxMask);

    scaledUnsharp = scale*(input-blurredInput);

    output = input + scaledUnsharp;
    
end

