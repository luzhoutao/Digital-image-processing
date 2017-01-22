function [ output ] = spatialFiltering( input, mask )
% this is the gernic function for spatial filtering

    [M,N] = size(input);
    [m,n] = size(mask); % assert that the dimensions of mask are all odd.
    
    output = zeros(M,N);
    for x = 1:M
        for y = 1:N
           for i = 1:m
               for j = 1:n
                   target_x = x-i+(m+1)/2;
                   target_y = y-j+(n+1)/2;
                   % when the pixel is out of the bound, get the value from the image [mirroring]
                   if(target_x <= 0)    
                       target_x = 1-target_x;
                   else if(target_x > M)
                           target_x = M-(target_x-M);
                       end
                   end
                   if(target_y <= 0)
                       target_y = 1-target_y;
                   else if(target_y > N)
                           target_y = N-(target_y-N);
                       end
                   end
                   % get the sumation
                   output(x,y) = output(x,y)+input(target_x,target_y)*mask(i,j);
               end
           end
        end
    end
end


        


