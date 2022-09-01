function [n_I, n_Q, EstadoAWGN_I, EstadoAWGN_Q] = awgn(EbNo, length_r, EstadoAWGN_I, EstadoAWGN_Q, M)

[n_I_crudo, EstadoAWGN_I_crudo] = randg(length_r, EstadoAWGN_I);
[n_Q_crudo, EstadoAWGN_Q_crudo] = randg(length_r, EstadoAWGN_Q);
EstadoAWGN_I = EstadoAWGN_I_crudo;
EstadoAWGN_Q = EstadoAWGN_Q_crudo;

% Paso de Eb a Es
Es = sqrt(10^(EbNo/10) * log2(M) * 2);
factor = 1/Es;

n_I = (factor) .* n_I_crudo;
n_Q = (factor) .* n_Q_crudo;
end