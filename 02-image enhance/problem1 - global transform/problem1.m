% problem 3.1 log & power law

%read the image
image = im2single(imread('Fig0308(a)(fractured_spine).tif'));
sprintf('3.1 Intensity transformation');
image_1_1 = im2uint8(logTransform(image));
imwrite(image_1_1,'log_trans.tif'); % transform the intensity by log function and output

r = [0.2, 0.3, 0.4, 0.5, 0.6, 0.28,0.25,0.23];   % the testing case for power law transformation
for i = 1:length(r)
    image_1_2 = im2uint8(powerlawTransform(image,r(i)));
    imwrite(image_1_2,sprintf('%s%d%s','powerlaw_',r(i),'.tif'));
end