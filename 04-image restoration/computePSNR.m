function [ psnr ] = computePSNR( input1_s, input2_s )
% measure the performance of restoration by PSNR
% input1_s is the ground image; and input2_s is the estimated image
    [M, N] = size(input1_s);
    peak = max(max(input1_s));
    psnr = 10*log(M*N*peak/sum(sum((input1_s-input2_s).^2)))/log(10);
end
