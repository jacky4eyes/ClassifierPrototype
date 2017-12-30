function [Z, X_rcvr] = pca(X, K_in, percent)
%% brief documentary

% X: input data matrix
% K_in: the desired dimension after compression; if pass 0 to it, the
% program will be run base onpercent.
% percent: the desired variance retension. The higher its value is, the less
% error of the whole process; if pass 0 to it, the program will be run base
% on K_in


%% working code

[m, n] = size(X);                       % Obtaining useful values
[X, mu, sigma] = featureNormalize(X);   % normalization
[U, S, V] = svd(X'*X/m);                % Get SVD


if K_in == 0 && percent == 0
    
    percent = 0.99; % default 99% variance
    [K, var] = get_K(S, percent);
    Z = projectData(X, U, K);
    fprintf('\n The maximum K for Varance = %f is %d ... \n',var,K);
    X_rcvr = recoverData(Z, U, K);

elseif K_in == 0 && percent ~= 0
    
    [K, var] = get_K(S, percent);
    Z = projectData(X, U, K);
    fprintf('\n The maximum K for Varance = %f is %d ... \n',var,K);
    X_rcvr = recoverData(Z, U, K);
    
elseif percent == 0 && K_in ~= 0
    
    Z = projectData(X, U, K_in);
    var = get_var(S, K_in);
    fprintf('\n The Varance for K = %f is %f ... \n',K_in,var);
    X_rcvr = recoverData(Z, U, K_in);
    
elseif percent ~= 0 && K_in ~= 0
    
    error('Invalid input, you cant specify K and percent simultaneously')
    
end


end
