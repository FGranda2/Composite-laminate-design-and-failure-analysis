clear
%6655941
TU = 66;
V = 5;
WX = 59;
YZ = 41;

sig_Lpos = 900*1e6; % Pa
sig_Lneg = 800*1e6; % Pa
sig_Tpos = 55*1e6;  % Pa
sig_Tneg = 170*1e6; % Pa
Tau_LT = 90*1e6;    % Pa


A = -250 + 2 * TU;
B = 10 + 8*V;
C = WX;
D = 20 + YZ;
f_vec = [A*1000, B*1000, C*1000, D, 0, 0]';

E1 = 125*10^9; %Pa
E2 = 9.8*10^9; %Pa
G12 = 5.5*10^9; %Pa
v12 = 0.24;
t = 0.125*0.001; %meters
numPlies = 4;
zk = locations(numPlies,t);
for i1= -90:10:90
    for i2= -90:10:90
        for i3= -90:10:90
            for i4= -90:10:90
                angles = [i1 i2 i3 i4];
                Q_bar = computeQ_bar(E1,E2,G12,v12,angles,numPlies);
                Q_star = computeQ_star(numPlies, Q_bar, zk);
                stress_matCoord = stressMatCoord(Q_star, f_vec, zk, t, numPlies, Q_bar, angles);
                valuesTHill = tsai_hill(numPlies, sig_Lpos, sig_Lneg, sig_Tpos, sig_Tneg, Tau_LT, stress_matCoord);
                valuesTWu = tsai_wu(numPlies, sig_Lpos, sig_Lneg, sig_Tpos, sig_Tneg, Tau_LT, stress_matCoord);
            end
        end
    end
end

angles = [i1 i2 i3 i4];
                        Q_bar = computeQ_bar(E1,E2,G12,v12,angles,numPlies);
                        Q_star = computeQ_star(numPlies, Q_bar, zk);
                        stress_matCoord = stressMatCoord(Q_star, f_vec, zk, t, numPlies, Q_bar, angles);
                        valuesTHill = tsai_hill(numPlies, sig_Lpos, sig_Lneg, sig_Tpos, sig_Tneg, Tau_LT, stress_matCoord);
                        valuesTWu = tsai_wu(numPlies, sig_Lpos, sig_Lneg, sig_Tpos, sig_Tneg, Tau_LT, stress_matCoord);