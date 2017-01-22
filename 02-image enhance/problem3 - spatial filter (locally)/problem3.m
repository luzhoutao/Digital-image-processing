%problem 3.3 spatial filtering, enhace using laplacian filtering and
%unsharp masking

%read the image 0308 for laplacian filtering
image0 = im2single(imread('Fig0338(a)(blurry_moon).tif'));

laplacianMask = [0 1 0;1 -4 1;0 1 0];
scale = [-1,-2];
% scale = [1, -0.5, -1, -1.5, -2, -2.5,-5];
for i=1:2
    [result,scaledLaplacian] = laplacianFiltering(image0, laplacianMask, scale(i));
    imwrite(im2uint8(result),sprintf('%s%d%s','laplacian_filtering_',i,'.tif'));
    imwrite(im2uint8(scaledLaplacian),sprintf('%s%d%s','scaled_laplacian_',i,'.tif'));
end

mask= getLoG(3, 3/6);
imshow(laplacianFiltering(image0, mask, -1));
% change size(using LoG)
size = [3,5,7];
for i = 1:3
    special = getLoG(size(i),0.5);
    [result,scaledLaplacian] = laplacianFiltering(image0, special, -1);
    imwrite(im2uint8(result),sprintf('%s%d%s','LoG_filtering_size_',size(i),'.tif'));
    imwrite(im2uint8(scaledLaplacian),sprintf('%s%d%s','LoG_mask_size_',size(i),'.tif'));
end
size = 5;
sigma = [5/3,5/6,5/9,5/11];
for i = 1:4
    special = getLoG(5,sigma(i));
    [result,scaledLaplacian] = laplacianFiltering(image0, special, -1);
    imwrite(im2uint8(result),sprintf('%s%d%s','LoG_filtering_',i,'.tif'));
    imwrite(im2uint8(scaledLaplacian),sprintf('%s%d%s','LoG_mask_',i,'.tif'));
end
 
% % read the image for unsharp masking
% image1 = im2single(imread('Fig0340(a)(dipxe_text).tif'));
% boxMask = [1 1 1;1 1 1;1 1 1]/9;
% [result, scaledUnsharp, blurredInput] = UnsharpFiltering(image1, boxMask, 1);  
% imwrite(im2uint8(blurredInput),'blurred_unsharp.tif');
% imwrite(im2uint8(scaledUnsharp),'scaled_unsharp.tif');
% imwrite(im2uint8(result), 'result_unsharp.tif');
% 
% % different scale
% scale = [-1, 1, 2, 3, 4, 5, 6];
% for i=1:7
%     [result, scaledUnsharp, blurredInput] = UnsharpFiltering(image1, boxMask, scale(i));
%     imwrite(im2uint8(result),sprintf('%s%d%s', 'result_',i,'.tif'));
%     imwrite(im2uint8(scaledUnsharp),sprintf('%s%d%s','scaled_unsharp_',i,'.tif'));    
% end
% 
% % Gaussian average mask
% gMask = getGaussian(5);
% [result, scaledUnsharp, blurredInput] = UnsharpFiltering(image1, gMask, 4);  
% imwrite(im2uint8(result),'result_unsharp_g.tif');
% imwrite(im2uint8(scaledUnsharp),'scaled_unsharp_g.tif');
% % highboosting
% imwrite(im2uint8(result),'unsharp_filtering.tif');
% [result, scaledUnsharp, blurredInput] = UnsharpFiltering(image1, boxMask, 4.5); 
% imwrite(im2uint8(result),'highboosting_filtering.tif');
% %imshow(im2uint8(result));