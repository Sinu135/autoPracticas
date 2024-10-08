% Velazquez Duran Sinuhe de Jesus
% 02 de Octubre de 2024
% Suma de los numeros enteros pares del 2 al 2000

%declaracion de modulo y de funciones a exportar
-module(sumaPares).
-export([suma/0]).

suma() ->
    %Crea una lista desde 2 hasta 2000, luego filtra la lista sacando el
    %módulo de 2 a cada elemento, luego suma todos los elementos de la
    %lista resultante
    Suma = lists:sum([X || X <- lists:seq(2, 2000), X rem 2 == 0]),

    %Imprime el resultado
    io:format("La suma de los números pares del 2 al 2000 es: ~p~n", [Suma]).

