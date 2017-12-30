%% Initialization
clear ; close all; clc

%% Control panel
load('ex7data2.mat'); % Load the sample data
K = 3; % number of centroid
max_iters = 10; % iteration number

%% Code

initial_centroids = kMeansInitCentroids(X, K);

% Run K-Means algorithm. The 'true' at the end tells our function to plot
% the progress of K-Means
if size(X,2) > 3
    is_plot = false;
else
    is_plot = true;
end
[centroids, idx] = runkMeans(X, initial_centroids, max_iters, is_plot);
