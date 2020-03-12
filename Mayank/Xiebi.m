function out = Xiebi(membership, points, params);
    %the point template
    points.particle = []
    points.clusters = []
    sum = 0
    for k = 1:params.clusters.size
        
        for i = i:params.particle.size
           sum = sum + (membership(i,k).^2 * norm(points.particle(i) - points.clusters(k))); 
        end
        
    end
    clusterdist = [];
    for i = 1:
    
    Xiebiobjfcn = sum/(params.particle.size )
end
