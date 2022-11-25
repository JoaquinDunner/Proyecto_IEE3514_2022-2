function r = fa(r_an, Nup, Pulso, Retardo)
    FA = flip(Pulso);
    bits = floor((length(r_an)+1-Nup)/Nup); 
    convolution = conv(r_an,FA);
%     disp(['largo de convolution: ',num2str(length(convolution))])
    
%     figure(4)
%     plot(real(convolution))
%     hold on
%     title('Convolucion de fa()')
%     xlabel('Muestras')
%     ylabel('Señal convolucionada')
%     grid on

    r = zeros(1,bits);
    for i = 1:bits
        if i*Nup+Retardo >= length(convolution)
            break
        end
%         r(i) = convolution(1,i*Nup+Retardo);
%         disp(['indice de convolution: ',num2str(i*Nup + Retardo)])
        r(i) = convolution(1, (i-1)*Nup + Retardo);

%         hold on
%         plot((i-1)*Nup + Retardo, r(i),'o','MarkerSize',10);
    end
end