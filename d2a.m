function s_an = d2a(s, Nup, Pulso)
    L = length(s);
    s_zerostuffed = zeros(1,Nup*L);
    cnt = 1;
    for i = s
        s_zerostuffed(cnt) = i;
        cnt = cnt + Nup;
    end
    s_an = conv(s_zerostuffed,Pulso,"full");
end