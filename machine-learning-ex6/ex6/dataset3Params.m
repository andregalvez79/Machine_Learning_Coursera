function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
#value of error to compare with
my_error = 1;
#values for C and sigma as suggested
values = [0.01 0.03 0.1 0.3 1 3 10 30];
# a for loop to train the models 8 values 2 vars =(64) using all variation of C and sigma

for i=1:length(values)
    for j=1:length(values)
        C_test = values(i);
        sigma_test = values(j);
        model = svmTrain(X, y, C_test, @(x1, x2) gaussianKernel(x1, x2, sigma_test)); 
        #now caluclate the predicitons using the corss validation set
        predictions = svmPredict(model, Xval);
        #and now the prediciton error
        pred_error = mean(double(predictions ~= yval));
        #now we need to get the parameters that minimize the error for the
        #cross validation set... so 
        if pred_error < my_error,
          C = C_test;
          sigma= sigma_test;
          my_error = pred_error;
        end
    end
end


% =========================================================================

end
