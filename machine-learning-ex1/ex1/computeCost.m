function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

  %x is the design matrix
  %y is the class labels
  m=size(X,1); %number of prediction examples
  predicitons = X*theta; %prediction of hypothesis for all m values
  sqrErrors = (predicitons-y).^2; %squared errors the. means each value square
  J= 1/(2*m) * sum(sqrErrors);




% =========================================================================

end
