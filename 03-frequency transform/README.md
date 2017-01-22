SPEC

## Two-Dimensional Fast Fourier Transform   

The purpose of this project is to develop a 2-D FFT program "package" that will be used in several other projects that follow.

(a) Multiply the input image by (-1)x+y to center the transform for filtering.

(b) Multiply the resulting (complex) array by a real filter function (in the sense that the the real coefficients multiply both the real and imaginary parts of the transforms).  Recall that multiplication of two images is done on pairs of corresponding elements.

(c) Compute the inverse Fourier transform.

(d) Multiply the result by (-1)x+y and take the real part.

(e) Compute the spectrum.

Using MATLAB, then Fourier transform program will not be limited to images whose size are integer powers of 2; otherwise, then the FFT routine may be limited to integer powers of 2.  In this case, it is necessary to zoom or shrink an image to the proper size by using the program in lab1. Then compute the 2-D FFT.

An approximation:  To simplify this and the following projects, ignore image padding (Section 4.6.6).  Although the results will not be strictly correct, significant simplifications will be gained not only in image sizes, but also in the need for cropping the final result. The principles will not be affected by this approximation.

## Fourier Spectrum and Average Value  

Compare the DC component of the spectrum and the average value of the image.
 
## Lowpass Filtering   

Implement the Gaussian lowpass filter in Eq. (4.8-7).  You must be able to specify the size, M x N, of the resulting 2D function.  In addition, the location of the center of the Gaussian function should be assigned by the user.

## Highpass Filtering   

Implement the Gaussian highpass filter of Eq. (4.9-4).

The directory contains:
|code | description|
|---- | ----|
|myDFT2.m | the brute force version of DFT|
|myFFT2.m | the Fast Fourier transform|
|myGLPF.m | generate the Gaussian lowpass filter in frequency domain|
|myGHPF.m | generate the Gaussian highpass filter in frequency domain|
|myIFFT2.m | the inverse FFT|
|myIDFT2.m | the inverse DFT|
|myDFT2_matrix | the matrix version of DFT|
|twoDFFT.m | the script for frequency transform|
|average_value.m | the script for DC component vs. average intensity value|
|lowpass_filtering.m | the script for gaussian lowpass filtering|
|highpass_filtering.m | the script for gaussian highpass filtering|


