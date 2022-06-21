function [Report] = maxStressFail(numPlies, sig_Lpos, ...
    sig_Lneg, sig_Tpos, sig_Tneg, Tau_LT, stress_matCoord)
% Performs maximum stress failure criterion to each ply

for i = 1:numPlies
    
    st_mat_coord = stress_matCoord{i};
    if st_mat_coord(1) > -sig_Lneg && st_mat_coord(1) < sig_Lpos
        Result(1) = 0;
    else
        Result(1) = 1;
    end
    if st_mat_coord(2) > -sig_Tneg && st_mat_coord(2) < sig_Tpos
        Result(2) = 0;
    else
        Result(2) = 1;
    end 
    
    if abs(st_mat_coord(3)) < Tau_LT
        Result(3) = 0;
    else
        Result(3) = 1;
    end
    
    if sum(Result) == 0
        Report{i,1} = sprintf('The ply %d didnt fail', round(i));
    else
        Report{i,1} = sprintf('The ply %d failed', round(i));
    end 
end
end

