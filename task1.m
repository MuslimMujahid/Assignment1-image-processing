image = imread('images/nuts.tif');

figure
myhist(image);

function hist = myhist(image)
    if size(image, 3) == 1
        grayimage = image;
    elseif size(image, 3) == 3
        grayimage = rgb2gray(image);
    end
    
    hist = histogram(grayimage, 256);
end