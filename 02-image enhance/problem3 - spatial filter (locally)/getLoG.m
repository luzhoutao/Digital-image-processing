function [ mask ] = getLoG( size, sigma)
% get the Laplacian of Gaussian mask of size

center_x = (size+1)/2;
center_y = (size+1)/2;

sum = 0;
for i = 1:size
    for j = 1:size
        mask(i,j) = ((i-center_x).^2+(j-center_y).^2-2*sigma.^2)/(sigma.^4)*exp((-(i-center_x).^2-(j-center_y).^2)/2/sigma.^2);
        sum = sum + mask(i,j);
    end
end
mask = mask-sum/(size*size);
end

