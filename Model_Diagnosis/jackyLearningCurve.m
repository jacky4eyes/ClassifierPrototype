% Implementation randomly selection (jacky's method)

fprintf('-------------- optional 2 starts here -------------\n')
lambda = 0.01;
collection1 = zeros(m,50);
collection2 = zeros(m,50);

parfor i = 1:50;
    fprintf('the %d time of randomisation\n',i)
    ind1 = randperm(12)';
    ind2 = randperm(21)';
    X_poly_temp = X(ind1,:);
    y_temp = y(ind1,:);
    Xval_temp = Xval(ind2(1:12,1),:);
    yval_temp = yval(ind2(1:12,1),:);
    [collection1(:,i) collection2(:,i)] = learningCurve(X_poly_temp,y_temp,Xval_temp,yval_temp,lambda);
end

trainerror = mean(collection1,2)
valerror = mean(collection2,2)
plot(1:m, trainerror, 1:m, valerror)