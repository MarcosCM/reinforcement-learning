% selecci�n de siguiente estado seg�n probabilidad de transici�n
% Utiliza un modelo de transici�n T(s,s,s')=P(s'|s,a) para simular el comportamiento y generar
% las muestras
% 'sigu' es una variable de selecci�n

%%%%%%%%%%%%%%%%%%%%%%%%%%% COMPLETAR ***************************
function [sig_estado, accion] = seleccion_siguiente(T, Q, epsilon, nacts, s)
    n = rand();
    % Exploracion
    if n > epsilon
        accion = randi(nacts);
    % Explotacion
    else
        [~, accion] = max(Q(s, :));
    end
    
    sig_estado = [];
    while size(sig_estado, 1) == 0
        sig_estado = find((cumsum(T(s, accion, :)) - rand()) >= 0, 1);
    end
end