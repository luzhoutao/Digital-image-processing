%problem 3.2 histogram transform

%read the image
image = imread('Fig0308(a)(fractured_spine).tif');
sprintf('3.2 Histogram  Processing');
histVector = imageHist(image);
plot(histVector);   
saveas(gcf,'origin_hist','tif');    % get the origin histogram
clear gcf;

[image_2,T] = histEqualization(image);  

imwrite(image_2,'enhanced_image.tif');  % output the result image

stairs(T);
saveas(gcf,'trans_func','tif');
clear gcf;  % output the plot of transformation function

new_histVector = imageHist(image_2);
plot(new_histVector);
saveas(gcf,'result_hist','tif');    % get the result histogram
clear gcf;

% enhance the image by histogram matching
final  = specMatch(T,image);
imwrite(final,'specMatch_image.tif');
final_histVector = imageHist(final);
plot(final_histVector);   
saveas(gcf,'final_hist','tif');    % get the origin histogram
clear gcf;