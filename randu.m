function [u, estadoN] = randu(N, estado0)
    ep_n_ant = estado0;
    u_matrix = zeros(1,N);
    for n = 1:N
        ep_n =  mod((7^5 * ep_n_ant), 2^31 - 1);
        u_n = ep_n / (2^31 - 1);
        u_matrix(1,n) = u_n;
        estadoN_var = ep_n;
        ep_n_ant = ep_n;
    end
    u = u_matrix;
    estadoN = estadoN_var;
end