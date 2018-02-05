function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%

#for J
A= sigmoid(X*theta); # hypothesis de logistic regression
#formula
J = 1/m * sum((-y.*log(A)) - ((1-y).*log(1-A)));

#####gradeint descent###
grad = (1 / m).* X' * (A - y); #for each number in the matrix x'*A-y divie 1/m

%it's a matrix so you don-t need to add by every element




% =============================================================

end
