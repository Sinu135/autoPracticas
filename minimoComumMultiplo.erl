%Velazquez Duran Sinuhe de Jesus
%2 de Octubre de 2024
%Generar parejas de enteros y calcular el minimo comun multilpo

-module(minimoComunMultiplo).
-export([generar/1]).


generar(Rango) ->

    %Generar tupla de todas las convinaciones de enteros entre 1 y el rango
    Parejas = [{X, Y} || X <- lists:seq(1, Rango), Y <- lists:seq(1, Rango)],

    %Ejecutar funcion anonima por cada tupla
    lists:foreach(fun({X, Y}) ->
        MCM = mcm(X, Y),
        io:format("MCM de (~p, ~p) es: ~p~n", [X, Y, MCM])
    end, Parejas).

% Función para calcular el MCM de dos números
mcm(A, B) ->
    (A * B) div mcd(A, B).

% Función para calcular el máximo común divisor usando el algoritmo de Euclides
mcd(0, B) -> B;
mcd(A, 0) -> A;
mcd(A, B) -> mcd(B, A rem B).

