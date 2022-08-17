function [prbs, estadoN] = prbs15(N, estado0)
    tren = estado0;
    estado = estado0;
    prbs = zeros(1,N);
    for n = 1:N
        MSB = tren(1);
        LSB = tren(15);
        for i = 1:14    % Para todos menos para el 1, que se cambia después
            estado(i+1) = tren(i);
        end
        % Xor
        if (MSB == 0 && LSB == 0) || (MSB == 1 && LSB == 1)
            bit_xor = 0;
        else
            bit_xor = 1;
        end
        prbs(n) = bit_xor;
        estado(1) = bit_xor;
        tren = estado;
    end
    estadoN = estado;
end