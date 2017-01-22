function [ mask ] = getGaussian( size )
% get different size of Gaussian average mask; assert size is odd
center_x = (size+1)/2;
center_y = (size+1)/2;

sigma = size/6;
sum = 0;
for i=1:size
    for j=1:size
        mask(i,j) = exp((-(i-center_x).^2-(j-center_y).^2)/(2*(sigma.^2)));
        sum = sum+mask(i,j);
    end
end
mask = mask/sum;
end

