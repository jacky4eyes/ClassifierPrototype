function [ error ] = test( X,y, Xtest, ytest, lambda )

theta = trainLinearReg(X,y,lambda);
error = linearRegCostFunction(Xtest,ytest,theta,0);

end

