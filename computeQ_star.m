function [St_mat] = computeQ_star(numPlies, Q_hat, zk)
% Compute Q_star stiffness matrix of the laminate

%Compute Matrix A [Pa-m]
A = zeros(3);

for i = 1:3 % Rows
    for j = 1:3 % Columns
        value=[];
        for N = 1:numPlies % Plies
            Q_var = Q_hat{N};   % Recover the Q_hat matrix for each ply
            value(N) = Q_var(i,j) * (zk(N+1) - zk(N));
        end
        A(i,j) = sum(value);
    end
end

%Compute Matrix B [Pa-m^2]
B = zeros(3);
for i = 1:3 % Rows
    for j = 1:3 % Columns
        value=[];
        for N = 1:numPlies % Plies
            Q_var = Q_hat{N};   % Recover the Q_hat matrix for each ply
            value(N) = Q_var(i,j) * ((zk(N+1)^2) - (zk(N)^2));
        end
        B(i,j) = sum(value);
    end
end
B = B / 2;

%Compute Matrix D [Pa-m^3]
D = zeros(3);
for i = 1:3 % Rows
    for j = 1:3 % Columns
        value=[];
        for N = 1:numPlies % Plies
            Q_var = Q_hat{N};   % Recover the Q_hat matrix for each ply
            value(N) = Q_var(i,j) * ((zk(N+1)^3) - (zk(N)^3));
        end
        D(i,j) = sum(value);
    end
end
D = D / 3;
St_mat = [A,B;B,D];
end