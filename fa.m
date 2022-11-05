function r = fa(r_an, Nup, Pulso, Retardo)
    FA = flip(Pulso);
    bits = floor(length(r_an)/Nup);
    r = zeros(1,bits);
    for i = 1:bits
        index = (i-1) * Nup + 1;
        convolution = conv(r_an(index:index+Nup-1),FA);
        r(i) = convolution(1,Retardo);
    end
end