function [stress_matCoord,strains,strain_plies,stress_plies] = ...
    stressMatCoord(St_mat, f_vec, zk, t, numPlies, Q_hat, angles)
% Compute the stresses in the material coordinate system for each ply

strains = inv(St_mat)*f_vec;
z = zk(1:numPlies) + t/2;

for i = 1:numPlies
    
   strain_plies{i} = strains(1:3) + z(i)*strains(4:6);
   stress_plies{i} = Q_hat{i} * strain_plies{i};
   th = deg2rad(angles(i));   % Angles in radians
     
   T = [cos(th)^2, sin(th)^2, 2*cos(th)*sin(th);...
   sin(th)^2, cos(th)^2, -2*cos(th)*sin(th);...
   -cos(th)*sin(th), cos(th)*sin(th), cos(th)^2-sin(th)^2]; 
   stress_matCoord{i} = T * stress_plies{i};
    
end


end

