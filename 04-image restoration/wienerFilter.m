function [ output_f ] = wienerFilter( input_f, H, K )
% the wiener filter in frequency domain 
    W = conj(H)./(abs(H).^2+K);
    output_f = W.*input_f;
end
% function [ output_f ] = wienerFilter(input_f, H, K)
% %UNTITLED6 此处显示有关此函数的摘要
% %   此处显示详细说明
% [M,N]=size(input_f); 
%  output_f =im2single(zeros(M,N));
% for u=1:M
%     for v=1:N
%         output_f(u,v)=((1/H(u,v))*((H(u,v)*conj(H(u,v)))/(H(u,v)*conj(H(u,v)))+K))*input_f(u,v);
%     end
% end
% 
% end
