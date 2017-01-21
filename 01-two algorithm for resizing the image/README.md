Two algorithms for resizing the image:##w
  1. Duplication of nearest pixel: to assign every pixel in the new location by replicating the value of its nearest neighbor
  2. Bilinear approximation: to estimate the pixels’ value in consideration of its four nearest neighbors
  
Measure the performance by recovery rate.

Origin image
![](/01-two%20algorithm%20for%20resizing%20the%20image/Fig0220(a)(chronometer 3692x2812  2pt25 inch 1250 dpi).tif)

Shrink and zoom back by duplication
![](/01-two%20algorithm%20for%20resizing%20the%20image/zoom_nearest.tif)

Shrink and zoon back by bilinear
![](/01-two%20algorithm%20for%20resizing%20the%20image/zoom_bilinear.tif)
