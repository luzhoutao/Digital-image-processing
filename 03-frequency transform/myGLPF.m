function [ output ] = myGLPF( D0, M, N )
%get the Gaussian lowpass filter, D0 is the variance, size M*N
    u0 = M/2;
    v0 = N/2;
    for u = 1:M
        for v = 1:N
            D = ((u-u0)^2+(v-v0)^2)^(1/2);
            output(u,v) = exp(-D^2/(2*D0^2));
        end
    end
end

