%Velazquez Duran Sinuhe de Jesus
%02 de octubre de 2024
%Simular la cantidad en depredadores y presas en un ecosistema

-module(ecosistema).
-export([simular/5]).

simular(Tiempo, P_inicial, D_inicial, Tasa_crecimiento_presas, Tasa_mortalidad_depredadores) ->
    
    % Simulación paso a paso, requiere tiempo, poblacion de depredadores incial,
    % poblacion de presas inicial, la tasa de crecimiento de las presas y la
    % tasa de mortalidad de los depredadores
    simular_ecosistema(Tiempo, P_inicial, D_inicial, Tasa_crecimiento_presas, Tasa_mortalidad_depredadores).

% Función recursiva que simula la población en cada paso de tiempo
simular_ecosistema(0, P, D, _, _) ->
    io:format("Tiempo: 0 | Presas: ~p | Depredadores: ~p~n", [P, D]),
    io:format("Simulacion terminada~n");

simular_ecosistema(Tiempo, P, D, Tasa_crecimiento_presas, Tasa_mortalidad_depredadores) ->
    % Cálculo de las nuevas poblaciones en base a las ecuaciones de Lotka-Volterra
    Nuevas_presas = P + (Tasa_crecimiento_presas * P) - (0.01 * P * D),
    Nuevos_depredadores = D + (0.01 * P * D) - Tasa_mortalidad_depredadores * D,

    % Imprime el estado actual del ecosistema
    io:format("Tiempo: ~p | Presas: ~p | Depredadores: ~p~n", [Tiempo, round(Nuevas_presas), round(Nuevos_depredadores)]),

    %Si el numero de presas o depredadores llega a 0, se acaba la simulacion    
    case Nuevas_presas =< 0 orelse Nuevos_depredadores =< 0 of
        true ->
            io:format("Simulacion terminada~n");
        false ->
            % Simula el siguiente paso de tiempo
            simular_ecosistema(Tiempo - 1, Nuevas_presas, Nuevos_depredadores, Tasa_crecimiento_presas, Tasa_mortalidad_depredadores)
    end.
