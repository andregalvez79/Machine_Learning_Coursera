function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)
%COFICOSTFUNC Collaborative filtering cost function
%   [J, grad] = COFICOSTFUNC(params, Y, R, num_users, num_movies, ...
%   num_features, lambda) returns the cost and gradient for the
%   collaborative filtering problem.
%

% Unfold the U and W matrices from params
X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
                num_users, num_features);

            
% You need to return the following values correctly
J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost function and gradient for collaborative
%               filtering. Concretely, you should first implement the cost
%               function (without regularization) and make sure it is
%               matches our costs. After that, you should implement the 
%               gradient and use the checkCostFunction routine to check
%               that the gradient is correct. Finally, you should implement
%               regularization.
%
% Notes: X - num_movies  x num_features matrix of movie features
%        Theta - num_users  x num_features matrix of user features
%        Y - num_movies x num_users matrix of user ratings of movies
%        R - num_movies x num_users matrix, where R(i, j) = 1 if the 
%            i-th movie was rated by the j-th user
%
% You should set the following variables correctly:
%
%        X_grad - num_movies x num_features matrix, containing the 
%                 partial derivatives w.r.t. to each element of X
%        Theta_grad - num_users x num_features matrix, containing the 
%                     partial derivatives w.r.t. to each element of Theta
%
%cost without REG
%cost function when R==1 so if the ith movie is rated by the jth user
J = 0.5*sum((((X*Theta')-Y).^2)(R==1));
#derivatives without REG
%unregularized vectorized implementation
X_grad = (((X*Theta')-Y).*R)*Theta; #times R because it's when R = 1  
%unregularized vectorized implementation
Theta_grad = ((((X*Theta')-Y).*R)'*X);           

#adding regularization
%First theta part of the reg
J = J + ((lambda/2)*sum(sum(Theta.^2)));
%now the parto of X in the reg function
J = J +  ((lambda/2)*sum(sum(X.^2)));
#now the derivatives
%first the x reg vectorized implementation
X_grad = X_grad + lambda*X;
%remember that this last part + lambda... denotes the mean for predicting
%users without infromation
Theta_grad  =  Theta_grad + lambda*Theta;









% =============================================================

grad = [X_grad(:); Theta_grad(:)];

end
