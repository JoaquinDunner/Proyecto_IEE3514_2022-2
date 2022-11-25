function Pulso = pulso(Nup, TipoPulso, ParamsPulso)
    % Coseno elevado
    if TipoPulso == 1
        T = 1;
        t = 0:T/Nup:T*(Nup-1)/Nup;
        Pulso = sqrt(2/(3*T)) * (1 + cos(2*pi * (t-T/2)/T));

        if Nup == 2
            Pulso = Pulso/sqrt(8/3);
        else
            Pulso = Pulso/sqrt(Nup);
        end

%         stem(Pulso)

    % Root-raised cosine
    elseif TipoPulso == 2
        beta = ParamsPulso(1);
        NTPulso = ParamsPulso(2);
%         f = -sqrt(NTPulso)/2: 1/NTPulso :sqrt(NTPulso)/2-1/NTPulso;
        f = -Nup/2: 1/NTPulso : Nup/2-1/NTPulso;
        Ts = 1;
        plano = Ts .* (-(1 - beta)/(2*Ts) <= f & f <= (1 - beta)/(2*Ts));
        bajada = Ts/2 * (1 + cos(pi*Ts/beta *(f - (1-beta)/(2*Ts)) )) .* ((1 - beta)/(2*Ts) < f & f < (1 + beta)/(2*Ts));
        subida = Ts/2 * (1 + cos(pi*Ts/beta *(-f - (1-beta)/(2*Ts)) )) .* (-((1 - beta)/(2*Ts)) > f & f > -((1 + beta)/(2*Ts)));
        rrc_f = sqrt(Nup) * sqrt(subida + plano + bajada);
        
%         figure(3)
%         stem(f,rrc_f,'ro')
%         title('Pulso(f)')
%         title('Pulso en dominio la frecuencia')
%         ylabel('Respuesta al impulso')
%         xlabel('Frecuencia normalizada (T=1)')
%         grid on

        rrc_t = ifftshift(ifft(fftshift(rrc_f)));
        Pulso = rrc_t;
    % Pulso cuadrado típico
    else
        if Nup ~= 2
            Pulso = ones(1,Nup) * 1/sqrt(Nup);
        elseif Nup == 2
            Pulso = [0 1];
        else
            Pulso = 1;
        end
        
    end
end