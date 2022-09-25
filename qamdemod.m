function MensajeBinarioRx = qamdemod(real_r, imag_r, M)

    % Forma 1
    pos = 1;
    MensajeBinarioRx = zeros(1,length(real_r)*log2(M));
    
    for i = 1:length(real_r)
        % BPSK
        if M == 2
            indice_real = find(abs([-1 1]-real_r(i)) == min(abs([-1 1]-real_r(i))));
            if indice_real == 1
                MensajeBinarioRx(i) = 0;
            elseif indice_real == 2
                MensajeBinarioRx(i) = 1;
            end
    
        % QPSK    
        elseif M == 4
            indice_real = find(abs(1/sqrt(2) .* [-1 1]-real_r(i)) == min(abs(1/sqrt(2) .* [-1 1]-real_r(i))));
            indice_imag = find(abs(1/sqrt(2) .* [1 -1]-imag_r(i)) == min(abs(1/sqrt(2) .* [1 -1]-imag_r(i))));
    
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
            pos = pos + log2(M);
        
        % 16-QAM
        elseif M == 16
            indice_real = find(abs(1/sqrt(10) .* [-3 -1 1 3]-real_r(i)) == min(abs(1/sqrt(10) .* [-3 -1 1 3]-real_r(i))));
            indice_imag = find(abs(1/sqrt(10) .* [3 1 -1 -3]-imag_r(i)) == min(abs(1/sqrt(10) .* [3 1 -1 -3]-imag_r(i))));
    
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
            pos = pos + log2(M);
    
        % 64-QAM    
        elseif M == 64
            indice_real = find(abs(1/sqrt(42) .* [-7 -5 -3 -1 1 3 5 7]-real_r(i)) == min(abs(1/sqrt(42) .* [-7 -5 -3 -1 1 3 5 7]-real_r(i))));
            indice_imag = find(abs(1/sqrt(42) .* [7 5 3 1 -1 -3 -5 -7]-imag_r(i)) == min(abs(1/sqrt(42) .* [7 5 3 1 -1 -3 -5 -7]-imag_r(i))));
    
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
            pos = pos + log2(M);
        end
    end
end