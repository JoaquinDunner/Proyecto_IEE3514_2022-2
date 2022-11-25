function [Err_s, Err_b] = errores(MensajeBinario, MensajeBinarioRx, M)

% Los hacemos del mismo largo
% length(MensajeBinario)
% length(MensajeBinarioRx)
MensajeBinarioRx = MensajeBinarioRx(1:length(MensajeBinario));

% Error de bit
Err_b = sum(MensajeBinario ~= MensajeBinarioRx);

% Error de símbolo
pos = 1;
if M == 2
    m = 0;
elseif M == 4
    m = 1;
elseif M == 16
    m = 3;
elseif M == 64
    m = 5;
end

Err_s = 0;
for total_simbolos = 1:length(MensajeBinario)/log2(M)
    if sum((MensajeBinario(pos:pos+m) ~= MensajeBinarioRx(pos:pos+m))) > 0
        Err_s = Err_s + 1;
    end
    pos = pos + log2(M);
end

end