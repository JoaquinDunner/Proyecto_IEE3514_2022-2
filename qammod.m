function [s_I, s_Q] = qammod(MensajeBinario, M)
    index_mensaje = 1;
    index_s = 1;
    check = 1;
    maximum = length(MensajeBinario)/log2(M);
    s_I = zeros(1,maximum);
    s_Q = zeros(1,maximum);
    while check <= maximum
    % BPSK
    % Es = 1
    if M == 2
        paquete = MensajeBinario(1,index_mensaje);
        if paquete == 1
            s_I(index_s) = 1;
            s_Q(index_s) = 0;
        elseif paquete == 0
            s_I(index_s) = -1;
            s_Q(index_s) = 0;
        end
    % QPSK
    % Es = 4 -> alpha = 1/4
    elseif M == 4
        alpha = 1/4;
        paquete = MensajeBinario(1,[index_mensaje : index_mensaje + 1]);
        if paquete == [0 1]
            s_I(index_s) = -1;
            s_Q(index_s) = 1;
        elseif paquete == [0 0]
            s_I(index_s) = -1;
            s_Q(index_s) = -1;
        elseif paquete == [1 1]
            s_I(index_s) = 1;
            s_Q(index_s) = 1;
        elseif paquete == [1 0]
            s_I(index_s) = 1;
            s_Q(index_s) = -1;
        end
    % 16-QAM
    elseif M == 16
        paquete = MensajeBinario(1,[index_mensaje : index_mensaje + 3]);
        if paquete == [0 0 1 0]
            s_I(index_s) = -3;
            s_Q(index_s) = 3;
        elseif paquete == [0 1 1 0]
            s_I(index_s) = -1;
            s_Q(index_s) = 3;
        elseif paquete == [1 1 1 0]
            s_I(index_s) = 1;
            s_Q(index_s) = 3;
        elseif paquete == [1 0 1 0]
            s_I(index_s) = 3;
            s_Q(index_s) = 3;
        elseif paquete == [0 0 1 1]
            s_I(index_s) = -3;
            s_Q(index_s) = 1;
        elseif paquete == [0 1 1 1]
            s_I(index_s) = -1;
            s_Q(index_s) = 1;
        elseif paquete == [1 1 1 1]
            s_I(index_s) = 1;
            s_Q(index_s) = 1;
        elseif paquete == [1 0 1 1]
            s_I(index_s) = 3;
            s_Q(index_s) = 1;
        elseif paquete == [0 0 0 1]
            s_I(index_s) = -3;
            s_Q(index_s) = -1;
        elseif paquete == [0 1 0 1]
            s_I(index_s) = -1;
            s_Q(index_s) = -1;
        elseif paquete == [1 1 0 1]
            s_I(index_s) = 1;
            s_Q(index_s) = -1;
        elseif paquete == [1 0 0 1]
            s_I(index_s) = 3;
            s_Q(index_s) = -1;
        elseif paquete == [0 0 0 0]
            s_I(index_s) = -3;
            s_Q(index_s) = -3;
        elseif paquete == [0 1 0 0]
            s_I(index_s) = -1;
            s_Q(index_s) = -3;
        elseif paquete == [1 1 0 0]
            s_I(index_s) = 1;
            s_Q(index_s) = -3;
        elseif paquete == [1 0 0 0]
            s_I(index_s) = 3;
            s_Q(index_s) = -3;
        end
    % 64-QAM
    elseif M == 64
        paquete = MensajeBinario(1,[index_mensaje : index_mensaje + 5]);
        % Fila 1
        if paquete == [0 0 0 1 0 0]
            s_I(index_s) = -7;
            s_Q(index_s) = 7;
        elseif paquete == [0 0 1 1 0 0]
            s_I(index_s) = -5;
            s_Q(index_s) = 7;
        elseif paquete == [0 1 1 1 0 0]
            s_I(index_s) = -3;
            s_Q(index_s) = 7;
        elseif paquete == [0 1 0 1 0 0]
            s_I(index_s) = -1;
            s_Q(index_s) = 7;
        elseif paquete == [1 1 0 1 0 0]
            s_I(index_s) = 1;
            s_Q(index_s) = 7;
        elseif paquete == [1 1 1 1 0 0]
            s_I(index_s) = 3;
            s_Q(index_s) = 7;
        elseif paquete == [1 0 1 1 0 0]
            s_I(index_s) = 5;
            s_Q(index_s) = 7;
        elseif paquete == [1 0 0 1 0 0]
            s_I(index_s) = 7;
            s_Q(index_s) = 7;
        % Fila 2    
        elseif paquete == [0 0 0 1 0 1]
            s_I(index_s) = -7;
            s_Q(index_s) = 5;
        elseif paquete == [0 0 1 1 0 1]
            s_I(index_s) = -5;
            s_Q(index_s) = 5;
        elseif paquete == [0 1 1 1 0 1]
            s_I(index_s) = -3;
            s_Q(index_s) = 5;
        elseif paquete == [0 1 0 1 0 1]
            s_I(index_s) = -1;
            s_Q(index_s) = 5;
        elseif paquete == [1 1 0 1 0 1]
            s_I(index_s) = 1;
            s_Q(index_s) = 5;
        elseif paquete == [1 1 1 1 0 1]
            s_I(index_s) = 3;
            s_Q(index_s) = 5;
        elseif paquete == [1 0 1 1 0 1]
            s_I(index_s) = 5;
            s_Q(index_s) = 5;
        elseif paquete == [1 0 0 1 0 1]
            s_I(index_s) = 7;
            s_Q(index_s) = 5;
        % Fila 3  
        elseif paquete == [0 0 0 1 1 1]
            s_I(index_s) = -7;
            s_Q(index_s) = 3;
        elseif paquete == [0 0 1 1 1 1]
            s_I(index_s) = -5;
            s_Q(index_s) = 3;
        elseif paquete == [0 1 1 1 1 1]
            s_I(index_s) = -3;
            s_Q(index_s) = 3;
        elseif paquete == [0 1 0 1 1 1]
            s_I(index_s) = -1;
            s_Q(index_s) = 3;
        elseif paquete == [1 1 0 1 1 1]
            s_I(index_s) = 1;
            s_Q(index_s) = 3;
        elseif paquete == [1 1 1 1 1 1]
            s_I(index_s) = 3;
            s_Q(index_s) = 3;
        elseif paquete == [1 0 1 1 1 1]
            s_I(index_s) = 5;
            s_Q(index_s) = 3;
        elseif paquete == [1 0 0 1 1 1]
            s_I(index_s) = 7;
            s_Q(index_s) = 3; 
        % Fila 4
        elseif paquete == [0 0 0 1 1 0]
            s_I(index_s) = -7;
            s_Q(index_s) = 1;
        elseif paquete == [0 0 1 1 1 0]
            s_I(index_s) = -5;
            s_Q(index_s) = 1;
        elseif paquete == [0 1 1 1 1 0]
            s_I(index_s) = -3;
            s_Q(index_s) = 1;
        elseif paquete == [0 1 0 1 1 0]
            s_I(index_s) = -1;
            s_Q(index_s) = 1;
        elseif paquete == [1 1 0 1 1 0]
            s_I(index_s) = 1;
            s_Q(index_s) = 1;
        elseif paquete == [1 1 1 1 1 0]
            s_I(index_s) = 3;
            s_Q(index_s) = 1;
        elseif paquete == [1 0 1 1 1 0]
            s_I(index_s) = 5;
            s_Q(index_s) = 1;
        elseif paquete == [1 0 0 1 1 0]
            s_I(index_s) = 7;
            s_Q(index_s) = 1;
        % Fila 5
        elseif paquete == [0 0 0 0 1 0]
            s_I(index_s) = -7;
            s_Q(index_s) = -1;
        elseif paquete == [0 0 1 0 1 0]
            s_I(index_s) = -5;
            s_Q(index_s) = -1;
        elseif paquete == [0 1 1 0 1 0]
            s_I(index_s) = -3;
            s_Q(index_s) = -1;
        elseif paquete == [0 1 0 0 1 0]
            s_I(index_s) = -1;
            s_Q(index_s) = -1;
        elseif paquete == [1 1 0 0 1 0]
            s_I(index_s) = 1;
            s_Q(index_s) = -1;
        elseif paquete == [1 1 1 0 1 0]
            s_I(index_s) = 3;
            s_Q(index_s) = -1;
        elseif paquete == [1 0 1 0 1 0]
            s_I(index_s) = 5;
            s_Q(index_s) = -1;
        elseif paquete == [1 0 0 0 1 0]
            s_I(index_s) = 7;
            s_Q(index_s) = -1;
        % Fila 6
        elseif paquete == [0 0 0 0 1 1]
            s_I(index_s) = -7;
            s_Q(index_s) = -3;
        elseif paquete == [0 0 1 0 1 1]
            s_I(index_s) = -5;
            s_Q(index_s) = -3;
        elseif paquete == [0 1 1 0 1 1]
            s_I(index_s) = -3;
            s_Q(index_s) = -3;
        elseif paquete == [0 1 0 0 1 1]
            s_I(index_s) = -1;
            s_Q(index_s) = -3;
        elseif paquete == [1 1 0 0 1 1]
            s_I(index_s) = 1;
            s_Q(index_s) = -3;
        elseif paquete == [1 1 1 0 1 1]
            s_I(index_s) = 3;
            s_Q(index_s) = -3;
        elseif paquete == [1 0 1 0 1 1]
            s_I(index_s) = 5;
            s_Q(index_s) = -3;
        elseif paquete == [1 0 0 0 1 1]
            s_I(index_s) = 7;
            s_Q(index_s) = -3;
        % Fila 7
        elseif paquete == [0 0 0 0 0 1]
            s_I(index_s) = -7;
            s_Q(index_s) = -5;
        elseif paquete == [0 0 1 0 0 1]
            s_I(index_s) = -5;
            s_Q(index_s) = -5;
        elseif paquete == [0 1 1 0 0 1]
            s_I(index_s) = -3;
            s_Q(index_s) = -5;
        elseif paquete == [0 1 0 0 0 1]
            s_I(index_s) = -1;
            s_Q(index_s) = -5;
        elseif paquete == [1 1 0 0 0 1]
            s_I(index_s) = 1;
            s_Q(index_s) = -5;
        elseif paquete == [1 1 1 0 0 1]
            s_I(index_s) = 3;
            s_Q(index_s) = -5;
        elseif paquete == [1 0 1 0 0 1]
            s_I(index_s) = 5;
            s_Q(index_s) = -5;
        elseif paquete == [1 0 0 0 0 1]
            s_I(index_s) = 7;
            s_Q(index_s) = -5;
        % Fila 8
        elseif paquete == [0 0 0 0 0 0]
            s_I(index_s) = -7;
            s_Q(index_s) = -7;
        elseif paquete == [0 0 1 0 0 0]
            s_I(index_s) = -5;
            s_Q(index_s) = -7;
        elseif paquete == [0 1 1 0 0 0]
            s_I(index_s) = -3;
            s_Q(index_s) = -7;
        elseif paquete == [0 1 0 0 0 0]
            s_I(index_s) = -1;
            s_Q(index_s) = -7;
        elseif paquete == [1 1 0 0 0 0]
            s_I(index_s) = 1;
            s_Q(index_s) = -7;
        elseif paquete == [1 1 1 0 0 0]
            s_I(index_s) = 3;
            s_Q(index_s) = -7;
        elseif paquete == [1 0 1 0 0 0]
            s_I(index_s) = 5;
            s_Q(index_s) = -7;
        elseif paquete == [1 0 0 0 0 0]
            s_I(index_s) = 7;
            s_Q(index_s) = -7;
        end
    end
    index_mensaje = index_mensaje + log2(M);
    index_s = index_s + 1;
    check = check + 1;
    end
    % Normalización para Es = 1:
    if M == 2
        alpha = 1;
    elseif M == 4
        alpha = 1/sqrt(2);
    elseif M == 16
        alpha = 1/sqrt(10);
    elseif M == 64
        alpha = 1/sqrt(42);
    end
    s_I = alpha .* s_I;
    s_Q = alpha .* s_Q;
end