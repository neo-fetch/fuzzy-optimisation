clc
clear all
rng('shuffle');
x=rand(100,2)
y=rand(100,2)
fnc = objectiveFunc(x,y,0.5);
disp("K(x,y): " + fnc);
[A,b]=pareto1(x); %returns pareto optimal sols 'A' and their row number matrix 'b' in x.
scatter(x(:,1),x(:,2),'red');
hold on;
scatter(A(:,1),A(:,2),'green');
legend({'Points','Pareto Front'})
