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

% % randu
%     function [u, estadoN] = randu(N, estado0)
%         ep_n_ant = estado0;
%         u_matrix = zeros(1,N);
%         for nn = 1:N
%             ep_n =  mod((7^5 * ep_n_ant), 2^31 - 1);
%             u_n = ep_n / (2^31 - 1);
%             u_matrix(1,nn) = u_n;
%             estadoN_var = ep_n;
%             ep_n_ant = ep_n;
%         end
%     
%         u = u_matrix;
%         estadoN = estadoN_var;
%     end