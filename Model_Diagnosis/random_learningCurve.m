function [ error_train, error_val ] = random_learningCurve(X, y, Xval, yval, lambda )
%RANDOM_LEARNINGCURVE Summary of this function goes here
%   Detailed explanation goes here
m = size(X, 1);


% You need to return these values correctly

error_train = zeros(m, 1);
error_val = zeros(m, 1);
for i = 1:m
    theta = trainLinearReg(X(1:i, :),y(1:i),lambda);
    error_train(i) = linearRegCostFunction(X(1:i,:),y(1:i),theta, 0);
    error_val(i)   = linearRegCostFunction(Xval(1:i,:),yval(1:i),theta, 0);
end
end