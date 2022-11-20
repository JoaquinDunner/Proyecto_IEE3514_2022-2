function r = fa(r_an, Nup, Pulso, Retardo)
    FA = flip(Pulso);
    bits = (length(r_an)+1-Nup)/Nup;
    convolution = conv(r_an,FA);
    
    r = zeros(1,bits);
    for i = 1:bits      
        r(i) = convolution(1,i*Retardo);
    end
end