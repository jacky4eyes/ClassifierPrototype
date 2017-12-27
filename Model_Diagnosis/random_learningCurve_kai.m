function [ error_train, error_val ] = random_learningCurve_kai(X, y, Xval, yval, lambda )
%RANDOM_LEARNINGCURVE Summary of this function goes here
%   Detailed explanation goes here
theta = trainLinearReg(X,y,lambda);
error_train = linearRegCostFunction(X,y,theta, 0);
error_val  = linearRegCostFunction(Xval,yval,theta, 0);
end

