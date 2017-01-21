function [ resultedImage ] = resizeImage_bilinear( originalImage, scalingFactor )
%This is the function for resizing an image by bilinear interpolation,
%which is to find the value of target pixel under the consideration of the nearest
%four neighbours.

    [rows, columns] = size(originalImage);  % get the size of input image
    newRows= round(rows*scalingFactor);
    newColumns = round(columns*scalingFactor);  %calculate the new size according to scaling factor

    %loop to assgin each element of resulted image
    for x = 1 : newRows
        for y = 1 : newColumns
           target_x = (x-1)/(newRows-1)*(rows-1)+1;
           target_y = (y-1)/(newColumns-1)*(columns-1)+1;   % get the target coordinate
           if round(target_x)==target_x
               if round(target_y)==target_y
                   %exactly on the original pixel
                   resultedImage(x,y) = originalImage(target_x,target_y);
               else
                   %exactly on a specific row
                    A1 = [1 single(floor(target_y)); 1 double(ceil(target_y))];
                    B1 = [double(originalImage(target_x, floor(target_y))); double(originalImage(target_x, ceil(target_y)))];
                    resultedImage(x,y) = [1 target_y]*(A1\B1);
               end
           else 
                if round(target_y)==target_y
                    %exactly on a specific column
                    A2 = [1 double(floor(target_x)); 1 double(ceil(target_x))];
                    B2 = [double(originalImage(floor(target_x), target_y)); double(originalImage(ceil(target_x), target_y))];
                    resultedImage(x,y) = [1 target_x]*(A2\B2);
                else
                   % not on a specific row or column
                   % get the neighbours of the target point
                   neighbours(1,:) = [double(floor(target_x)) double(floor(target_y))];%top_left
                   neighbours(2,:) = [double(floor(target_x)) double(ceil(target_y))];%top_right
                   neighbours(3,:) = [double(ceil(target_x)) double(floor(target_y))];%down_left
                   neighbours(4,:) = [double(ceil(target_x)) double(ceil(target_y))];%down_right
                   % calculate the argument of the equation
                   for r = 1 : length(neighbours)
                       A(r,:) = [1 neighbours(r,1) neighbours(r,2) neighbours(r,1)*neighbours(r,2)];
                       B(r,:) = [double(originalImage(neighbours(r,1), neighbours(r,2)))];
                   end
                   argu = A\B;
                   % get the target pixel value and assign
                   resultedImage(x, y) = round([1 target_x target_y target_x*target_y]*argu);
               end
           end
        end
    end
end
