function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

########part 1####### 

%is feedforward implemntation like in last excercie %predict.m
% 1. Feed-forward to compute h = a3.
a1 = [ones(m, 1) X];  % creates a matrix that adds ones to the first column
%of the matrix X there fore the size is 401 and not 400. size = 401 x 5000
#the ones are the bias unit
z2 = a1*Theta1'; #now compute the z of the hidden layer
a2 = [ones(size(z2, 1), 1) sigmoid(z2)];  % 26 x m, once computed we add the bias unit 
#to the hidden layer and transform it to values between 1 and 0  
z3 = a2*Theta2'; % 10 x m, now compute the second layer 
a3 = sigmoid(z3); %because it is the last layer we do not add the bias units

%make the y num of label matching to vector of 1 and 0

I = eye(num_labels); %singular matrix size the number of labels 10X10
Y = zeros(m, num_labels); %create an empty matrix size the y 5000(m)X10
for i=1:m %now for loop to creat the vector 
  Y(i, :)= I(y(i), :); %Y row i to all columns = the row of the identity 
  %matrix that matches with the row of y which is a number of the label in y
%example for number 10 in row 1 of y search the identity matrix and add a one
end

% Compute the non-regularized error. Fully vectorized.
J = (1/m) * sum(sum(-Y .* log(a3) - (1 - Y) .* log(1 - a3)));
%like in the lecture notes
%now implement the cost with REG
%so theta 1 call for row vector que empieze del segundo elemento al final donde
% cada elemento este elavado al cuadrado
reg_cost = sum(sum(Theta1(:, 2:end).^2, 2))+ sum(sum(Theta2(:, 2:end).^2, 2));
J = J + (lambda/(2*m))* reg_cost;

######Part 2#######
%backpropagation to get the error terms from the sigmas we computed
% calculate sigmas
d3 = a3.-Y; %like in the lecture it is a matrix with the error from the last layer
#now we use the errors to backpropagate to the hidden layer 
#according to the formula each element of the matrix needs to be multiplied by 
#the derivative of sigmoid or sigmoid gradient

%the paper says : Note that you need to add a +1 term to ensure that
%the vectors of activations for layers a(1) and a(2) also include the bias
%unit.
%so 
z2 = [ones(size(z2, 1), 1) z2] ;
%https://stackoverflow.com/questions/20336521/how-to-insert-a-column-row-of-ones-into-a-matrix
d2 = (d3*Theta2).*sigmoidGradient(z2);
#we should skip or remove delta 0 as it is the input layer before accumulation
d2 = d2(:, 2:end);

% accumulate gradients big delta.. when lambda is = 0  we compute the 
% partial derivative of j (theta) so first we get a matrix: 
delta_1 = (d2'*a1);
delta_2 = (d3'*a2);

#then we accumulate it
#Obtain the (unregularized) gradient for the neural network cost func-
#tion by dividing the accumulated gradients by 1/m
Theta2_grad = (1/m) * delta_2;
Theta1_grad = (1/m) * delta_1;

######Part 3#####
%implement the algorithm with reg term
%we need to skip the first column again...
#so we create a column of zeros and replace it with the matrix theta 2 
#without the ones

Theta2_grad = Theta2_grad + (lambda/m) * [zeros(size(Theta2, 1), 1) Theta2(:, 2:end)];
Theta1_grad =  Theta1_grad + (lambda/m) * [zeros(size(Theta1, 1), 1) Theta1(:, 2:end)];

#now unroll the parameters into a single vector for the fminc function














% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
