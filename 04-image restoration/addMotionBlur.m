function [ output_f, H ] = addMotionBlur( input_f, T, a, b )
% goal: add motion blur to the input image
%   since it is space-invariant and linear,
%   it can be done by multiplying infrequency domain
    [M, N] = size(input_f);
    for x = 1:M
        for y = 1:N
            u = x-M/2;
            v = y-N/2;
            phase = pi*(a*u+b*v);
            if(phase == 0)
                H(x, y) = T;
            else
                H(x, y) = (T/phase)*sin(phase)*exp(-1i*phase);
            end
        end
    end
    output_f = input_f.*H;
end

