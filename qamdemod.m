function MensajeBinarioRx = qamdemod(real_r, imag_r, M)
m = log2(M);
pos = 1;
MensajeBinarioRx = zeros(1,length(real_r)*m);
for i = 1:length(real_r)
    % BPSK
    if M == 2
        alpha = 1;
        real_teo = alpha .* [-1 1];
        diferencia_real = abs(real_teo-real_r(i));
        minima_dif_real = min(diferencia_real);
        indice_real = find(diferencia_real == minima_dif_real);
        
        if indice_real == 1
            MensajeBinarioRx(i) = 0;
        elseif indice_real == 2
            MensajeBinarioRx(i) = 1;
        end

    % QPSK    
    elseif M == 4
        alpha = 1/sqrt(2);
        real_teo = alpha .* [-1 1];
        imag_teo = alpha .* [1 -1];
        diferencia_real = abs(real_teo-real_r(i));
        diferencia_imag = abs(imag_teo-imag_r(i));
        minima_dif_real = min(diferencia_real);
        minima_dif_imag = min(diferencia_imag);
        indice_real = find(diferencia_real == minima_dif_real);
        indice_imag = find(diferencia_imag == minima_dif_imag);

        if indice_real == 1
            MensajeBinarioRx(pos) = 0;
        elseif indice_real == 2
            MensajeBinarioRx(pos) = 1;
        end
        if indice_imag == 1
            MensajeBinarioRx(pos+1) = 1;
        elseif indice_imag == 2
            MensajeBinarioRx(pos+1) = 0;
        end
        pos = pos + m;
    
    % 16-QAM
    elseif M == 16
        alpha = 1/sqrt(10);
        real_teo = alpha .* [-3 -1 1 3];
        imag_teo = alpha .* [3 1 -1 -3];
        diferencia_real = abs(real_teo-real_r(i));
        diferencia_imag = abs(imag_teo-imag_r(i));
        minima_dif_real = min(diferencia_real);
        minima_dif_imag = min(diferencia_imag);
        indice_real = find(diferencia_real == minima_dif_real);
        indice_imag = find(diferencia_imag == minima_dif_imag);

        if indice_real == 1
            MensajeBinarioRx(pos:pos+1) = [0 0];
        elseif indice_real == 2
            MensajeBinarioRx(pos:pos+1) = [0 1];
        elseif indice_real == 3
            MensajeBinarioRx(pos:pos+1) = [1 1];
        elseif indice_real == 4
            MensajeBinarioRx(pos:pos+1) = [1 0];
        end
        if indice_imag == 1
            MensajeBinarioRx(pos+2:pos+3) = [1 0];
        elseif indice_imag == 2
            MensajeBinarioRx(pos+2:pos+3) = [1 1];
        elseif indice_imag == 3
            MensajeBinarioRx(pos+2:pos+3) = [0 1];
        elseif indice_imag == 4
            MensajeBinarioRx(pos+2:pos+3) = [0 0];
        end
        pos = pos + m;

    % 64-QAM    
    elseif M == 64
        alpha = 1/sqrt(42);
        real_teo = alpha .* [-7 -5 -3 -1 1 3 5 7];
        imag_teo = alpha .* [7 5 3 1 -1 -3 -5 -7];
        diferencia_real = abs(real_teo-real_r(i));
        diferencia_imag = abs(imag_teo-imag_r(i));
        minima_dif_real = min(diferencia_real);
        minima_dif_imag = min(diferencia_imag);
        indice_real = find(diferencia_real == minima_dif_real);
        indice_imag = find(diferencia_imag == minima_dif_imag);

        if indice_real == 1
            MensajeBinarioRx(pos:pos+2) = [0 0 0];
        elseif indice_real == 2
            MensajeBinarioRx(pos:pos+2) = [0 0 1];
        elseif indice_real == 3
            MensajeBinarioRx(pos:pos+2) = [0 1 1];
        elseif indice_real == 4
            MensajeBinarioRx(pos:pos+2) = [0 1 0];
        elseif indice_real == 5
            MensajeBinarioRx(pos:pos+2) = [1 1 0];
        elseif indice_real == 6
            MensajeBinarioRx(pos:pos+2) = [1 1 1];
        elseif indice_real == 7
            MensajeBinarioRx(pos:pos+2) = [1 0 1];
        elseif indice_real == 8
            MensajeBinarioRx(pos:pos+2) = [1 0 0];
        end
        if indice_imag == 1
            MensajeBinarioRx(pos+3:pos+5) = [1 0 0];
        elseif indice_imag == 2
            MensajeBinarioRx(pos+3:pos+5) = [1 0 1];
        elseif indice_imag == 3
            MensajeBinarioRx(pos+3:pos+5) = [1 1 1];
        elseif indice_imag == 4
            MensajeBinarioRx(pos+3:pos+5) = [1 1 0];
        elseif indice_imag == 5
            MensajeBinarioRx(pos+3:pos+5) = [0 1 0];
        elseif indice_imag == 6
            MensajeBinarioRx(pos+3:pos+5) = [0 1 1];
        elseif indice_imag == 7
            MensajeBinarioRx(pos+3:pos+5) = [0 0 1];
        elseif indice_imag == 8
            MensajeBinarioRx(pos+3:pos+5) = [0 0 0];
        end
        pos = pos + m;
    end
end

end