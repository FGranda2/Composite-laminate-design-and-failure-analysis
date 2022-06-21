function [value] = tsai_wu(numPlies, sig_Lpos, ...
    sig_Lneg, sig_Tpos, sig_Tneg, Tau_LT, stress_matCoord)
% Compute the Tsai-Wu criterion value for each ply

%Tsai-Wu variables
F_11 = 1/(abs(sig_Lpos*sig_Lneg));
F_22 = 1/(abs(sig_Tpos*sig_Tneg));
F_1 = (1/sig_Lpos)-(1/abs(sig_Lneg));
F_2 = (1/sig_Tpos)-(1/abs(sig_Tneg));
F_66 = 1/Tau_LT^2;
F_12 = -sqrt(F_11*F_22)/2;


for i = 1:numPlies
   
   st_mat_coord = stress_matCoord{i};
   
   value(i) = F_11* st_mat_coord(1)^2 + F_22* st_mat_coord(2)^2 ...
   +F_66*st_mat_coord(3)^2 +F_1* st_mat_coord(1) + F_2* st_mat_coord(2) ...
   + 2*F_12*st_mat_coord(1)*st_mat_coord(2);
   
end

end

