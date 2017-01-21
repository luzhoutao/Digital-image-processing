% Read the original image and show it.
originalImage = imread('Fig0220(a)(chronometer 3692x2812  2pt25 inch 1250 dpi).tif');

%Shrink the image to 1/10 by replication(nearest neighbor interpolation) , show and ouput the result image
scalingFactor = .1;
resultedImage_1 = resizeImage_replication(originalImage, scalingFactor);
imwrite(resultedImage_1,'shrink_nearest.tif');

%Zoom the resulted image back to original size by replication(nearest neighbor interpolation), show and output it
scalingFactor = 10;
resultedImage_2 = resizeImage_replication(resultedImage_1, scalingFactor);
imwrite(resultedImage_2,'zoom_nearest.tif');

%Shrink the image to 100dpi by bilinear interpolation, show and output the result image
scalingFactor = 0.08;
resultedImage_3 = resizeImage_bilinear(originalImage, scalingFactor);
imwrite(resultedImage_3, 'shrink_bilinear.tif');

%Zoom the resulted image back to original size by bilinear interpolation, show and output it 
scalingFactor = 12.5;
resultedImage_4 = resizeImage_bilinear(resultedImage_3, scalingFactor);
imwrite(resultedImage_4,'zoom_bilinear.tif');