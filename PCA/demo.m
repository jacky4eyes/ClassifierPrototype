%% This file is for demo purpose

%% Initialization
clear ; close all; clc

load ('exampledata.mat');


%% 
K = 1;

[X_norm, mu, sigma] = featureNormalize(X);

[Z, X_rec] = pca(X,1,0);



scatter(X_norm(:,1),X_norm(:,2));
hold on;
scatter(X_rec(:,1), X_rec(:,2));
