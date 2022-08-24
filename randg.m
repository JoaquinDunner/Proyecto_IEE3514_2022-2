function [g, estadoN] = randg(N, estado0)
    n = 1;
    eta_n = estado0;
    g = zeros(1,N);
    while n <= N
        [u, estado] = randu(2, eta_n);
        eta_n = estado;
        s = (2*u(1)-1)^2 + (2*u(2)-1)^2;
        if s < 1
            g(n) = (2*u(1)-1) * sqrt(-2*log(s)/s);
            n = n + 1;
        end
    end
    estadoN = eta_n;
end