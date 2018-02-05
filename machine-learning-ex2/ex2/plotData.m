function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%
#first get indices for y=0 and y=1
pos = find(y==1);
neg = find(y==0);
#the plot is saying give me the positive y==1 column 1 of the data set 
#and put it as the X axis
#and give me the 2nd column of the data X where pos y==1, and plot is as Y axis 
% Plot the data for pos examples
plot(X(pos,1), X(pos,2),'k+','LineWidth', 2,'MarkerSize', 10); 
% plot data for neg
plot(X(neg,1),X(neg,2), 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 10) 
%ylabel('Exam 2 scores'); % Set the yaxis label
%xlabel('Exam 1 scores'); % Set the xaxis label








% =========================================================================



hold off;

end
