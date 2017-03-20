function [U, Q, iter, util] = iteracion_valor(T, R, discount_factor)
% Resuelve la ecuaci�n de Bellman iterativamente.
% T(s,a,s') es la matriz de transici�n y R(s,a) la matriz de acciones.
% 'V' es el vector de utilidad para todos los estados
% 'Q' es el valor de Q(S,A) de la ecuaci�n de Bellman
% 'iter' es el n�mero de iteraciones realizadas.
% 'util' es la matriz que acumula por filas los valores de utilidad de todas las
% iteraciones

% Dimensiones del vector de estados
S = size(T,1);

% Valor inicial de V igual a R
oldV = max(R,[],2);

% Condici�n de finalizaci�n
done = 0;

% Algoritmo de iteracion_valor. Calcula las utilidades U para todos los
% estados
% Calcula Q y de ella las Utilidades V, hasta convergencia definica por un
% umbral de error.
% Se puede utilizar la funci�n 'approxeq(V, oldV, thresh)' para obtener la
% condici�n de finalizaci�n.
% Utiliza la funci�n Q_from_V que implementa la ecuaci�n de Bellman.

% Las iteraciones se detienen cuando |V(i) - oldV(i)| < delta.
% Esto conduce a un error respecto al �ptimo menor que
% 'error*gamma/(1-gamma)'
error = 1e-7;
delta = error*discount_factor/(1-discount_factor);

% Inicializaci�n
iter = 0;
util = [];

%%%%%%% COMPLETAR EL ALGORITMO DE ITERACI�N VALOR   %%%%%%%%%%%%%%%%%%%

U = zeros(1, S);
while ~done
    Q = Q_from_V(oldV, T, R, discount_factor);
    util = [util, oldV];
    
    U = max(Q, [], 2);
    
    done = approxeq(U, oldV, delta);
    oldV = U;
    iter = iter + 1;
end

for i=1:iter
    plot(1:iter, util(1, :), 1:iter, util(2, :), 1:iter, util(3, :), 1:iter, util(4, :), 1:iter, util(5, :));
end