function [ output, scaledLaplacian ] = laplacianFiltering( input, laplacianMask, scale )
% spatial filtering by laplacian

    scaledLaplacian = scale*spatialFiltering(input, laplacianMask);
    
    output = input+scaledLaplacian;

end

