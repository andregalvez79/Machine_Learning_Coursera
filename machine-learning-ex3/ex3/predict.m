function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%
###layer 1 to 2
#on the excercise says to add a row of 1 to X for the bias effect
a1 = [ones(m, 1) X];#we compute a1 which is the factors plus 1 matrix_type
Z2 = a1*Theta1'; #then the vectorized Z2 level which was the predicitions of the
#first layer
%%important the output should be 0 or 1 vectors
#therefore we transform in order to compare correctly
Z2 = sigmoid(Z2);
#layer 2 to 3 or output
a2 = [ones(size(Z2), 1) Z2]; # again compute a2 which is the Z2 predicitons, 
#and add 1
Z3 = a2*Theta2'; #using the "learned values" from the hidden layer compute
#the predictions for the last layer
%% the same we transform
Z3 = sigmoid(Z3);
[val,p] = max(Z3,[],2);  







% =========================================================================


end
