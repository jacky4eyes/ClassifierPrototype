%% Initialization
clear ; close all; clc
%% Control panel
load ('ex7data1.mat');
%% Demostration

K = 1;

[X_norm, mu, sigma] = featureNormalize(X);

[Z, X_rec] = pca(X,K,0);



scatter(X_norm(:,1),X_norm(:,2));
hold on;
scatter(X_rec(:,1), X_rec(:,2));
