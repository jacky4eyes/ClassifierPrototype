%% Implementation randomly selection (kai's method)

randomly_select_number = size(X,1);
error_train_record = zeros(randomly_select_number,1);
error_val_record = zeros(randomly_select_number,1);
lambda = 0.01;
repeat_times = 50;

parfor j = 1:randomly_select_number
    j
    for i = 1:repeat_times
        shuffle_index_train = randperm(size(X,1),j);
        shuffle_index_val = randperm(size(Xval,1),j);
        [error_train, error_val] = random_learningCurve_kai(X(shuffle_index_train,:), y(shuffle_index_train),...
            Xval(shuffle_index_val,:), yval(shuffle_index_val), lambda);
        error_train_record(j) = error_train_record(j) + error_train/repeat_times;
        error_val_record(j) = error_val_record(j) + error_val/repeat_times;
    end
end

figure;
title(['Shuffled selection training, Repeat times = ', num2str(repeat_times)]);
xlabel('Number of training examples');
ylabel('Error');
plot(1:randomly_select_number, error_train_record, 1:randomly_select_number, error_val_record);