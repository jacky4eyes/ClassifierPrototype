function [ error ] = test( X,y, Xtest, ytest, lambda )
%TEST Summary of this function goes here
%   Detailed explanation goes here

theta = trainLinearReg(X,y,lambda);
error = linearRegCostFunction(Xtest,ytest,theta,0);

end

