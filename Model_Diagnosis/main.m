clear ; close all; clc
fprintf('Start working\n')

%% Example data
% X & y: training set
% Xval & yval: validation set
% Xtest & ytest: testing set
load('dataexample.mat');
m = size(X, 1);         % record data dimension


%% Learning Curve

lambda = 0;
[error_train, error_val] = learningCurve(X, y, Xval, yval, lambda);
plot(1:m, error_train, 1:m, error_val);
title(sprintf('Learning Curve (lambda = %f)', lambda));
xlabel('Number of training examples')
ylabel('Error')
axis([0 13 0 100])
legend('Train', 'Cross Validation')
fprintf('# Training Examples\tTrain Error\tCross Validation Error\n');
for i = 1:m
    fprintf('  \t%d\t\t%f\t%f\n', i, error_train(i), error_val(i));
end


%% Selecting Lambda (validation curve)

[lambda_vec, error_train, error_val] = validationCurve(X, y, Xval, yval);
plot(lambda_vec, error_train, lambda_vec, error_val);
legend('Train', 'Cross Validation');
xlabel('lambda');
ylabel('Error');
fprintf('lambda\t\tTrain Error\tValidation Error\n');
for i = 1:length(lambda_vec)
	fprintf(' %f\t%f\t%f\n', lambda_vec(i), error_train(i), error_val(i));
end


%% two types of randomising learning curve

% jackyLearningCurve;

KaiLearningCurve;