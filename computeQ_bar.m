function [Q_hat] = computeQ_bar(E1, E2, G12, v12, angles, numPlies)
% Compute Q_bar matrices of each ply

%Set compliance matrix S
S = zeros(3);
S(1,1) = 1/E1;
S(2,2) = 1/E2;
S(1,2) = -v12 / E1;
S(2,1) = -v12 / E1;
S(3,3) = 1/G12;

%Get stiffness matrix Q
Q = inv(S);

%Set matrix T
syms th
T = [cos(th)^2, sin(th)^2, 2*cos(th)*sin(th);...
     sin(th)^2, cos(th)^2, -2*cos(th)*sin(th);...
     -cos(th)*sin(th), cos(th)*sin(th), cos(th)^2-sin(th)^2];

%Compute Q_hat of every lamina 
for i = 1:numPlies
   
     th = deg2rad(angles(i));   % Angles in radians
     
     T = [cos(th)^2, sin(th)^2, 2*cos(th)*sin(th);...
     sin(th)^2, cos(th)^2, -2*cos(th)*sin(th);...
     -cos(th)*sin(th), cos(th)*sin(th), cos(th)^2-sin(th)^2]; 
 
     Q_hat{i} = inv(T)*Q*inv(T.');  
     
 end
end

