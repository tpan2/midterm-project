imdata = imread('angry1.png');
length = size(imdata,1); 
width = size(imdata,2);
rn = randperm(10,1)
for ii=1:rn:length;
    for jj=1:rn:width;
        if imdata(ii, jj) >=50;
           imdata(ii,jj) = 500;
        end
        rn = randperm(10,1);
    end
    rn = randperm(10,1);
end
imshow(imdata)
