#load % loads the data e.g., load name.dat
%who %gives you the liost of varibales you loaded
%whos % gives yopu a nicer list with sizes
%clear % deletes everything
%save hello.txt variable - ascii% to save as txt file 
%plots%
%plot(x,y) to plot more things use: hold on, to change the
%color plot (x,y, "color"), xlablel (""), legend ("", "")
%title(""), and to save: print -dpng "name.png"
% to plot 2 figures separetly:
%figure (1); plot(x,y); figure (2); plot(x,y)
%to plot 2 things in one plot but different grids:
%subplot(1,2,1) so divide plot in a 1*2 grid and acces grid 1
%then plot(x,y), the access second grid
%subplot(1,2,2); plot(x,y)
%change axis range: axis ([0.5 1 -1 1]) lista de numeros
%clf clears figure
% for loops%

###remember to select and pres f9 to run otherwise it-s conflict por el acento

v=zeros(10,1)
for i =1:10,
  v(i)=2^i
end;
i=1;
while i <= 5,
  v(i)=100;
  i=i+1;
 end;
 
i=1
while true,
  v(i)= 999;
  i = i+1;
  if i ==6,
    break;
   end;
end;
v(1)

v(1)=2;
if v(1) ==1,
  disp('the value is one');
elseif v(1) == 2,
  disp('the value is two');
else
  disp('the value is not one or two')
end;

squareThisNumber(5) %directory is incorrect
pwd %cehcas dir
cd 'C:\Users\André\Google Drive\Machine_learning_stanford' %cambias manualmente
squarethis(5) %buscas el file
#aqui no funciona por el pinche acento
squareThisNumber(5) 

#hice otro file en wordpad que squares and cubes a number
[a,b] = squareAndCubeThisNUmber (5)
a
b
#create a fn that plots J(theta)
x = [1 1;1 2;1 3]
y =[1;2;3]
theta = [0;1];
%if we change theta  to:
theta = [0;0];
function J = costFunctionJ(x,y, theta)
  %x is the design matrix
  %y is the class labels
  m=size(x,1); %number of prediction examples
  predicitons = x*theta; %prediction of hypothesis for all m values
  sqrErrors = (predicitons-y).^2; %squared errors the. means each value square
  J= 1/(2*m) * sum(sqrErrors);
end;
J = costFunctionJ(x,y,theta)
#check is: *1^2 +2^2 +3^2)/(2*3) = 2.333
v=[1 2 3 4 5 6 7]
w=[1 2 3 4 5 6 7]
z = 0;
for i = 1:7
  z = z + v(i) * w(i)
end
%or
z=sum(v.*w)
g=magic(10)
u=[1 2 3 4 5 6 7 8 9 10]
v = zeros(10, 1);
for i = 1:10
  for j = 1:10
    v(i) = v(i) + g(i, j) * u(j);
  end
end
