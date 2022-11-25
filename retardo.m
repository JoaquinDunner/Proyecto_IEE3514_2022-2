function Retardo = retardo(Pulso, Canal)
    Lc = length(Canal);
    Lp = length(Pulso);
%     Retardo = floor((length(Canal)+length(Pulso))/2)-2;
%     Retardo = 0.5*length(Canal)+length(Pulso)-1;
%     if Canal(1) == 1 && Lc == 1
%         Retardo = Lp;
%     else
    Retardo = Lp + floor(0.5 * Lc);
%     end
%     disp(['Desde retardo() sale: ',num2str(Retardo)])
        
end