# Two algorithms for resizing the image:
Problem: given a specific pixel in the resized image, determine its intensity. If it has no exact corresponding pixel in the original image, try to estimate it.
<br/><br/>Proposed solution:
  1. Duplication of nearest pixel
    > assign every pixel in the new location by replicating the value of its nearest neighbor.
  
  2. Bilinear approximation:
    > estimate the pixels’ value in consideration of its four nearest neighbors,
    > solve 4 linear equation generated from four neighbors.
  
Measurement (quant)
  * recovery rate: shrink and zoom back to original size, and measure the final pixel intensity difference.
  * result: the latter is better. (conform with visual effects)

Click here for detail [report](https://github.com/luzhoutao/Digital-image-processing/blob/master/01-two%20algorithm%20for%20resizing%20the%20image/01report.pdf).
