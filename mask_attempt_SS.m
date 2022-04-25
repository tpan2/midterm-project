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

mask = randi([0 1], size(image));
mask = uint8(mask);
class(image)
class(mask)
actual_mask = mask.*image;

imshow(actual_mask)