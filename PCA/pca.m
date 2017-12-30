function [Z, X_rcvr] = pca(X, K_in, percent)
% if K, percent settle to 0, that means you dont want to use it
%
% Useful values
[m, n] = size(X);
% normalization
[X, mu, sigma] = featureNormalize(X);
% Get SVD
[U, S, V] = svd(X'*X/m);

%%
if K_in == 0 && percent == 0
    percent = 0.99; % default 99% variance
    [K, var] = get_K(S, percent);
    Z = projectData(X, U, K);
    fprintf('\n The maximum K for Varance = %f is %d ... \n',var,K);
    X_rcvr = recoverData(Z, U, K);
end
if K_in == 0 && percent ~= 0
    [K, var] = get_K(S, percent);
    Z = projectData(X, U, K);
    fprintf('\n The maximum K for Varance = %f is %d ... \n',var,K);
    X_rcvr = recoverData(Z, U, K);
end
if percent == 0 && K_in ~= 0
    Z = projectData(X, U, K_in);
    var = get_var(S, K_in);
    fprintf('\n The Varance for K = %f is %f ... \n',K_in,var);
    X_rcvr = recoverData(Z, U, K_in);
end
if percent ~= 0 && K_in ~= 0
    error('Invalid input, you cant specify K and percent simultaneously')
end






end
