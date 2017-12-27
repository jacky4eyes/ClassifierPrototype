clear ; close all; clc
fprintf('Start working\n')

%% Example data
load('dataexample.mat');
% X & y: training set
% Xval & yval: validation set
% Xtest & ytest: testing set

m = size(X, 1);         % record data dimension


%% Train Linear Regression

lambda = 0;
[theta] = trainLinearReg([ones(m, 1) X], y, lambda);


%% Learning Curve

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


% %% Implementation randomly selection (jacky's method)
% 
% randomly_select_number = size(X_poly,1);
% error_train_record = zeros(randomly_select_number,1);
% error_val_record = zeros(randomly_select_number,1);
% lambda = 0.01;
% repeat_times = 1;
% for i = 1:repeat_times
%     
%     shuffle_index_train = randperm(size(X_poly,1),randomly_select_number);
%     shuffle_index_val = randperm(size(X_poly_val,1),randomly_select_number);
%     [error_train, error_val] = random_learningCurve(X_poly(shuffle_index_train,:), y(shuffle_index_train),...
%         X_poly_val(shuffle_index_val,:), yval(shuffle_index_val), lambda);
%     error_train_record = error_train_record + error_train/repeat_times;
%     error_val_record = error_val_record + error_val/repeat_times;
% end
% 
% figure;
% title(['Shuffled selection training, Repeat times = ', num2str(repeat_times)]);
% xlabel('Number of training examples');
% ylabel('Error');
% plot(1:randomly_select_number, error_train_record,...
%     1:randomly_select_number, error_val_record);
% 
% 
% %% Implementation randomly selection (kai's method)
% 
% randomly_select_number = size(X_poly,1);
% error_train_record = zeros(randomly_select_number,1);
% error_val_record = zeros(randomly_select_number,1);
% lambda = 0.01;
% repeat_times = 50;
% 
% for j = 1:randomly_select_number
%     j
% for i = 1:repeat_times
%     shuffle_index_train = randperm(size(X_poly,1),j);
%     shuffle_index_val = randperm(size(X_poly_val,1),j);
%     [error_train, error_val] = random_learningCurve_kai(X_poly(shuffle_index_train,:), y(shuffle_index_train),...
%         X_poly_val(shuffle_index_val,:), yval(shuffle_index_val), lambda);
%     error_train_record(j) = error_train_record(j) + error_train/repeat_times;
%     error_val_record(j) = error_val_record(j) + error_val/repeat_times;
% end
% end
% 
% figure;
% title(['Shuffled selection training, Repeat times = ', num2str(repeat_times)]);
% xlabel('Number of training examples');
% ylabel('Error');
% plot(1:randomly_select_number, error_train_record,...
%     1:randomly_select_number, error_val_record);