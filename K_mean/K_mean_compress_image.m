%% Clear workspace & everything
clc
clear
close all
%% control panel
K = 5 ; % The higher K, the less compression
max_iters = 10; % The higher iteration, the higher compression quality
A = double(imread('bird_small.png')); % Load the image of what u want.

%% Actual code
fprintf('\nRunning K-Means clustering on pixels from an image.\n\n');

A = A / 255; % Divide by 255 so that all values are in the range 0 - 1
% Size of the image
img_size = size(A);
X = reshape(A, img_size(1) * img_size(2), 3);
initial_centroids = kMeansInitCentroids(X, K);
[centroids, idx] = runkMeans(X, initial_centroids, max_iters);
idx = findClosestCentroids(X, centroids);
X_recovered = centroids(idx,:);
X_recovered = reshape(X_recovered, img_size(1), img_size(2), 3);
subplot(1, 2, 1);
imagesc(A); 
title('Original');
subplot(1, 2, 2);
imagesc(X_recovered)
title(sprintf('Compressed, with %d colors.', K));