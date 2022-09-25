function [n_I, n_Q, EstadoAWGN_I, EstadoAWGN_Q] = awgn(EbNo, length_r, EstadoAWGN_I, EstadoAWGN_Q, M)

% Forma 1:
[n_I, EstadoAWGN_I] = randg(length_r, EstadoAWGN_I);
[n_Q, EstadoAWGN_Q] = randg(length_r, EstadoAWGN_Q);

n_I = 1/(sqrt(10^(EbNo/10) * log2(M) * 2)) .* n_I;
n_Q = 1/(sqrt(10^(EbNo/10) * log2(M) * 2)) .* n_Q;
end