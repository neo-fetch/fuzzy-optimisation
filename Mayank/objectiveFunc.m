function fnc = objectiveFunc(x,y,scalefac)
        [rows cols] = size(x);
        xavg = 0;
        for i =1:rows
            xavg = xavg + x(i);
        end
        xavg = xavg/rows;
        maxnorm = (norm(x(1) - xavg)).^2;
        for i = 2:rows
            if maxnorm < norm(x(i) - xavg)
                maxnorm = (norm(x(i) - xavg)).^2;
            end
        end
        sigmasq = maxnorm/scalefac;
        
        fnc = (exp(-1*(norm(x-y))))/(sigmasq);
end
