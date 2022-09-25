function [g, estadoN] = randg(N, estado0)
    
    % Forma 4
    n = 1;
    estadoN = estado0;
    g = zeros(1,N);
    while n <= N
        [u, estadoN] = randu(2, estadoN);
        if ((2*u(1)-1)^2 + (2*u(2)-1)^2) < 1
            g(n) = (2*u(1)-1) * sqrt(-2*log(((2*u(1)-1)^2 + (2*u(2)-1)^2))/((2*u(1)-1)^2 + (2*u(2)-1)^2));
            n = n + 1;
        end
    end
end