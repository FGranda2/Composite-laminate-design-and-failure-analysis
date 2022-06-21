function [Report] = failReport(numPlies, value)
% Report generator for failure criteria

for i = 1:numPlies
    
    if value(i) >= 1  
        Report{i,1} = sprintf('Ply %d failed with value: %g', ...
            round(i),round(value(i),4));
    else
        Report{i,1} = sprintf('Ply %d OK with value: %g', ...
            round(i),round(value(i),4));
    end
    
end


end

