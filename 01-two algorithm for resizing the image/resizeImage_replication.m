function [ resultedImage ] = resizeImage_replication(originalImage, scalingFactor )
%This is the function for resizing an image in the manner of finding the
%nearest neighbour pixel and replicate its intensity.

    [rows, columns] = size(originalImage);  % get the size of input image
    newRows= round(rows*scalingFactor);
    newColumns = round(columns*scalingFactor);  % calculate the new size according to scaling factor

    %loop to assgin each element of resulted image
    for x = 1 : newRows
        for y = 1 : newColumns
           target_x = (x-1)/(newRows-1)*(rows-1)+1;
           target_y = (y-1)/(newColumns-1)*(columns-1)+1;   %get the target coordinate
          
           nearest_x = round(target_x);
           nearest_y = round(target_y);    % get its neighbour point
           
           resultedImage(x, y) = originalImage(nearest_x,nearest_y);    % assign just by replicating the neighbour's value
        end
    end
    
end

