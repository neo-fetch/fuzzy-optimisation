
%% Function
function out = psofunc(problem, params)    
    %defining the cost function
    cstFunc = problem.cstFunc;
    vecCols = problem.vecCols;
    varSize = problem.varSize;
    varmin = problem.varmin;
    varmax = problem.varmax;
    
%% parameters
    maxiter = params.maxiter;
    swarmpop = params.swarmpop;
    w = params.w;
    dampingFac = params.dampingFac;
    c1 = params.c1;
    c2 = params.c2;
%% initialisation
    empty_particle.Position = [];
    empty_particle.Velocity = [];
    empty_particle.Cost = [];
    empty_particle.Best.Position = [];
    empty_particle.Best.Cost = [];
    
    particles = repmat(empty_particle,swarmpop,1);
    
    globalBest.Cost = inf;
    
    for i = 1:swarmpop
        particles(i).Position = unifrnd(varmin,varmax,varSize);
        particles(i).Velocity = zeros(varSize);
        particles(i).Cost = cstFunc(particles(i).Position);
        particles(i).Best.Position = particles(i).Position;
        particles(i).Best.Cost = particles(i).Cost;
        
        if particles(i).Best.Cost < globalBest.Cost
            globalBest = particles(i).Best;
        end
        bestCosts = zeros(maxiter, 1);
    end
%% loops
    
    for it = 1:maxiter
        for i = 1:swarmpop
            particles(i).Velocity = w*particles(i).Velocity + c1*rand(varSize).*(particles(i).Best.Position - particles(i).Position) + c2*rand(varSize).*(globalBest.Position - particles(i).Position);
            particles(i).Position = particles(i).Position +  particles(i).Velocity;
            
            particles(i).Cost = cstFunc(particles(i).Position);
            
            if particles(i).Cost < particles(i).Best.Cost
                particles(i).Best.Position = particles(i).Position;
                particles(i).Best.Cost = particles(i).Cost;
                
                if particles(i).Best.Cost < globalBest.Cost
                    globalBest = particles(i).Best;
                end
                
            end
            
        end
        bestCosts(it) = globalBest.Cost;
        disp("Iteration " + it + ": Best cost = " + bestCosts(it));
        
        w = w*dampingFac;
    end
    out.swarm = particles;
    out.bestSol = globalBest;
    out.bestCosts = bestCosts;
end
