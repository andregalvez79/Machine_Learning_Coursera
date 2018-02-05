function [X_poly] = polyFeatures(X, p)
%POLYFEATURES Maps X (1D vector) into the p-th power
%   [X_poly] = POLYFEATURES(X, p) takes a data matrix X (size m x 1) and
%   maps each example into its polynomial features where
%   X_poly(i, :) = [X(i) X(i).^2 X(i).^3 ...  X(i).^p];
%


% You need to return the following variables correctly.
X_poly = zeros(numel(X), p);

% ====================== YOUR CODE HERE ======================
% Instructions: Given a vector X, return a matrix X_poly where the p-th 
%               column of X contains the values of X to the p-th power.
%
% (:,1)all rows column 1
X_poly(:,1) = X; #set the first column to always be X original
for i=2:p #so the range is from the second column to P 
    #fill in tyhe matrix column with the multiplication of each element times
    #it-s own previous column if it-s 3 multiply X times X column squared to get
    #cube etc..
    X_poly(:,i) = X.*X_poly(:,i-1);
end





% =========================================================================

end
