function [ output ] = myDFT2_matrix( input )
% uitilize the optimization of matrix computation in matlab
[M,N] = size(input);
wm = exp(-2i*pi/M);
wn = exp(-2i*pi/N);

% generate the matrix w1
for i = 1:M
    for j = 1:i
        e = wm^((i-1)*(j-1));
        W1(i,j) = e;
        if(i~=j)
            W1(j,i) = e;
        end
    end
end
%generate the matrix w2
for i = 1:N
    for j = 1:i
        e = wn^((i-1)*(j-1));
        W2(i,j) = e;
        if(i~=j)
            W2(j,i) = e;
        end
    end
end
%transform
output = W1*input*W2;

end

