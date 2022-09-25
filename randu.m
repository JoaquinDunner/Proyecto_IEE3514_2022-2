function [u, estadoN] = randu(N, estado0)

    % Forma 7:
    if N == 2
        u = [mod((16807 * estado0), 2147483647) / (2147483647), mod((16807 * mod((16807 * estado0), 2147483647)), 2147483647) / (2147483647)];
        estadoN = mod((16807 * mod((16807 * estado0), 2147483647)), 2147483647);
    else
        ep_n_ant = estado0;
        u = zeros(1,N);
        for n = 1:N
            estadoN = mod((16807 * ep_n_ant), 2147483647);
            u(1,n) = estadoN / (2147483647);
            ep_n_ant = mod((16807 * ep_n_ant), 2147483647);
        end
    end

end