MyImages = dir(fullfile(pwd,'*1.png'));
RandomNumber = randi([1 size(MyImages,1)]);
MyRandomImage = MyImages(RandomNumber).name;
image = imread(MyRandomImage);
% imshow(image);

[rows, columns] = size(image);

%mask = randi([0 1], size(image));
%image(logical(image)) = mask(logical(image));
%image(logical(image)) = rand(1, nnz(image));

%image(image == 0) = randn(1, size(image(image == 0), 1));

n = 0;
while n < 1;
    n = n+1;
    mask = ones(size(image));
    noise_mask = randi([0 1], size(image));
    mask = uint8(mask);
    actual_mask = mask.*image;
    nonzeroes = find(actual_mask(:,:,:)>0);
    mask(nonzeroes) = noise_mask(nonzeroes)*255;
    final_mask = rgb2gray(mask);
    
%    actual_mask = actual_mask.>0;
    dimensions_act_mask = size(actual_mask)
%    for ii = 
 %       if actual_mask < 150
 %           actual
end
imshow(final_mask)