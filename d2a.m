function s_an = d2a(s, Nup, Pulso)
    s_zerostuffed = upsample(s,Nup);
    s_an = conv(s_zerostuffed,Pulso,"full");
end