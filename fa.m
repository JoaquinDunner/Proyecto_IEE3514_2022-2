function r = fa(r_an, Nup, Pulso, Retardo)
    FA = flip(Pulso);
%     bits = floor(length(r_an)/Nup);
    bits = (length(r_an)+1-Nup)/Nup;
    convolution = conv(r_an,FA);
    
    % FUNCIONA
%     if Nup == 2
%         c_norm = convolution / sqrt(8/3);
%     else
%         c_norm = convolution / sqrt(Nup);
%     end
    
    r = zeros(1,bits);
    for i = 1:bits      
        r(i) = convolution(1,i*Retardo);
    end
end