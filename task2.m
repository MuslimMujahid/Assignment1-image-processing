originalImage = imread('images/room.jpg');
enchantedImage = contrastEnchancement(originalImage);

figure
subplot(2, 1, 1), imshow(originalImage);
subplot(2, 1, 2), imshow(enchantedImage);

function enchantedImage = contrastEnchancement(originalImage)
    %find r_min and r_max
    r_min = min(matToVect(originalImage));
    r_max = max(matToVect(originalImage));
    
    n_row = size(originalImage, 1);
    n_col = size(originalImage , 2);
    n_dim = size(originalImage , 3);
    enchantedImage = zeros(n_row, n_col);
    for i = 1:n_row
        for j = 1:n_col
            for k = 1:n_dim
                pixelValue = originalImage(i, j, k);
                enchantedImage(i, j, k) = ceil((double(pixelValue-r_min)/double(r_max-r_min))*double(255));
            end
        end
    end
    
    enchantedImage = uint8(enchantedImage);
end

function vect = matToVect(mat)
    vect = reshape(mat, [], 1);
    vect = reshape(vect, 1, []);
end