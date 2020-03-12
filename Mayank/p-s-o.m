clc
clear all
%% Function
%defining the cost function
problem.cstFunc = @(x) Sphere(x);
problem.vecCols = 5;
problem.varSize = [1 problem.vecCols];
problem.varmin = -10;
problem.varmax = 10;

%% parameters
params.maxiter = 1500;
params.swarmpop = 90;
params.w = 1;
params.dampingFac = 0.87;
params.c1 = 2;
params.c2 = 2;
%% using function
out = psofunc(problem, params);

BestSol = out.bestSol;
BestCosts = out.bestCosts;

%% Results: 
semilogy(out.bestCosts, "LineWidth",2);
xlabel("Iterations");
ylabel("Best Cost");

grid on;
