function [ output ] = specMatch( T,input )
%improve the histogram transformation by specification matching

% designate the expected histogram 
spec_histo = zeros(256);
count = 0;
for i = 1:256
    if(i <= 10)
        spec_histo(i) = i*10;
    end
    if(i<=20 && i>10)
        spec_histo(i) = 190-9*i;
    end
    if(i<=200 && i>20)
        spec_histo(i) = round(100/9-i/18);
    end
    if(i>200 && i<=220)
        spec_histo(i) = round(i/2-100);
    end
    if(i>220)
        spec_histo(i) = round(73-2*i/7);
    end
    count = count + spec_histo(i);
end
spec_histo = spec_histo/count;
plot(spec_histo);
saveas(gcf,'spec_hist','tif');  % save the specific histogram
clear gcf;

% identify the transformation function from z to r using the specific historam
sum = 0;
for i = 1:256
    sum = sum + spec_histo(i);
    G(i) = round(sum*255);
end
stairs(G);
saveas(gcf,'trans_G','tif'); 
clear gcf;
%identify the transforamtion function from s to z
for i = 1:256
    r = T(i);
    delta = 257;
    for j =  1:256
       if(abs(r-G(j))<delta)
           delta = abs(r-G(j));
           Q(i) = j;
       end
    end
end
plot(Q);
saveas(gcf,'real_trans','tif'); 
clear gcf;
% transforming...
output = uint8(Q(input+1)-1);


end

