%% Initial
clear; 
close all; 
clc;
%% Parameters
input_layer_size  = 400;    % Input Features
hidden_layer_size = 40;     % Middle Layers: using matrix to represent the structure.
num_labels = 10;            % Output Classes
lambda = 0;                 % Regularization
Iteration = 150;             % Iteration times
load('ex4data1.mat');       % load the trainning sample
%% Code
initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

% Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

fprintf('\nChecking Backpropagation (w/ Regularization) ... \n')

%  Check gradients by running checkNNGradients
checkNNGradients(lambda);

fprintf('\n\nNow for iterations ... \n\n')
options = optimset('MaxIter', Iteration);

costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y, lambda);
                               
[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);
% Obtain Theta1 and Theta2 back from nn_params
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));


%% Prediction
pred = predict(Theta1, Theta2, X);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);


