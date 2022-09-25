function [prbs, estadoN] = prbs15(N, estado0)
    
% Forma 3:
tren = estado0;
estadoN = estado0;
prbs = zeros(1,N);
for n = 1:N
    estadoN(2:15) = tren(1:14);
    prbs(n) = xor(tren(1),tren(15));
    estadoN(1) = xor(tren(1),tren(15));
    tren = estadoN;
end

end