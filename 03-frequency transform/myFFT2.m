function [ output ] = myFFT2( input )
% compute IFFT (2D)(padding to 2-power)
    [M, N] = size(input);
    
    for row = 1:M
        line = input(row,:);
        output(row,:) = myFFT1_loop(line);
    end 
    for col = 1:N
        line = output(:,col);
        output(:,col) = myFFT1_loop(line')';
    end
    
end
function [ output ] = myFFT1_loop ( input )
    output = bitrevorder(input);
    M = length(input);
    level = log2(M);
   
    for lev = 1:level
        m = 2^lev;
        coef_delta = exp(-2i*pi/m);
        for s = 1:m:M
            coef = 1;
            half_m = m/2;
            for t = 0:half_m-1
                offset1 = s+t;
                offset2 = s+t+half_m;
                even = output(offset1);
                odd = coef*output(offset2);
                output(offset1) = even + odd;
                output(offset2) = even - odd;
                coef = coef*coef_delta;
            end
        end
    end
end


function [ output ] = myFFT1 ( input)
     M = length(input);
    if(M==1)
        output = input;
        return;
    end
    
    half = M/2;
    for i=1:half % 1..M/2
        g2(i) = input(2*i);   % odd in equation 2..M(1..M-1)
        g1(i) = input(2*i-1);   % even in equation 1..M-1(0..M-2)
    end
    
    G1 = myFFT1(g1);
    G2 = myFFT1(g2);
    
    coef_delta = exp(-2i*pi/M);
    coef = 1;
    for u=1:M/2
        temp = coef*G2(u);
        output(u) = G1(u)+temp;
        output(u+half) = G1(u)-temp;
        coef = coef*coef_delta;
    end
end

