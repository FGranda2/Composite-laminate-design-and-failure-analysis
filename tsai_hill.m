function [value] = tsai_hill(numPlies, sig_Lpos, ...
    sig_Lneg, sig_Tpos, sig_Tneg, Tau_LT, stress_matCoord)
% Compute the Tsai-Hill criterion value for each ply

for i = 1:numPlies
   
   st_mat_coord = stress_matCoord{i};
   
   if st_mat_coord(1) > 0 && st_mat_coord(2) > 0
       
      sig_L1 = sig_Lpos;
      sig_L2 = sig_Lpos;
      sig_T1 = sig_Tpos;
      
   end
   
   if st_mat_coord(1) > 0 && st_mat_coord(2) < 0
       
      sig_L1 = sig_Lpos;
      sig_L2 = sig_Lpos;
      sig_T1 = sig_Tneg;
      
   end
   
   if st_mat_coord(1) < 0 && st_mat_coord(2) > 0
       
      sig_L1 = sig_Lneg;
      sig_L2 = sig_Lneg;
      sig_T1 = sig_Tpos;
      
   end
   
   if st_mat_coord(1) < 0 && st_mat_coord(2) < 0
       
      sig_L1 = sig_Lneg;
      sig_L2 = sig_Lneg;
      sig_T1 = sig_Tneg;
      
   end
   
   value(i) = (st_mat_coord(1)^2 / sig_L1^2) - ...
       (st_mat_coord(1)*st_mat_coord(2)/sig_L2^2) + ...
       (st_mat_coord(2)^2 / sig_T1^2) + ...
   (st_mat_coord(3)^2 / Tau_LT^2);
    
end

end