function Pulso = pulso(Nup, TipoPulso, reservado1)
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

%         if Nup ~= 2
%             Pulso = Pulso * 1/sqrt(Nup);
%         elseif Nup == 2
%             Pulso = [0 1];
%         else
%             Pulso = 1;
%         end
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