function [Canal, basura1, basura2] = canal(Nup, TipoCanal, ParamsCanal)
    W = ParamsCanal(1);
    NTCanal = ParamsCanal(2);
    basura1 = W;
    basura2 = NTCanal;
    if TipoCanal == 1
        Canal = 1;
    elseif TipoCanal == 2
        t = -NTCanal/2: 1/Nup :NTCanal/2-1/Nup;
        p0 = W * (t == 0);
        sinc = W * sin(pi * W*t)./(pi * W*t) .* (t ~= 0);
        sinc(isnan(sinc)) = 0;
        c_t = p0 + sinc;
        Canal = c_t * 1/Nup;
    end
%     stem(Canal)
end