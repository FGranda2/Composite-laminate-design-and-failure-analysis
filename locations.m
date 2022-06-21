function [z_k] = locations(numPlies,t)
% Compute plate locations in z axis (Upwards)

for i = 1:numPlies+1
    
    z_k(i) = -(numPlies)* t/2 +t*(i-1);
    
end

end

