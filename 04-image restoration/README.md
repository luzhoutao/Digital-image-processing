SPEC

## Periodic Noise Reduction Using a Notch Filter    

(a) Write a program that implements sinusoidal noise of the form given in Problem 5.14.  The inputs to the program must be the amplitude, A, and the two frequency components u0 and v0 shown in the problem equation.

(b) Download image 5.26(a) from the book web site and add sinusoidal noise to it, with u0 = M/2 (the image is square) and v0 = 0.  The value of A must be high enough for the noise to be clearly visible in the image.

(c) Compute and display the spectrum of the image.  If the FFT program you developed in Project 4.01 can only handle images of size equal to an integer power of 2, reduce the size of the image to 512 x 512 or 256 x 256 using the program from Project 02-04.  Resize the image before adding noise to it.

(d) Notch-filter the image using a notch filter of the form shown in Fig. 5.19(c).

## Parametric Wiener Filter    

(a) Implement a blurring filter as in Eq. (5.6-11).

(b) Blur image 5.26(a) in the +45-degree direction using T = 1, as in Fig. 5.26(b).

(c) Add Gaussian noise of 0 mean and variance of 10 pixels to the blurred image.

(d) Restore the image using the parametric Wiener filter given in Eq. (5.8-3).