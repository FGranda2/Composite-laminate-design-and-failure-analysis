function [Plies_info] = infoPlies(stress_matCoord,strain_Global,stress_Global,numPlies)
% Organize stresses and strains by ply for analysis

for i =1:numPlies
        
    Plies_info(i*3-2:i*3,1:4) = [[i;i;i],strain_Global{i},stress_Global{i},stress_matCoord{i}];
    
end

end

