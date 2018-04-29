% procedimiento que genera una columna para la máquina
% si la columna generada es 0 significa que no ha encontrado la posibilidad
% prioridad: gana la máquina > evita que gane el jugador > columna aleatoria
% ** solo devuelve la mejor posibilidad, no cada una de ellas (!)
generar_columna_maquina(Columna, Tablero):-
    (
        (columna_gana_maquina(Tablero, 1, ColumnaGenerada), ColumnaGenerada \= 0, Columna is ColumnaGenerada);
        (columna_no_gana_jugador(Tablero, 1, ColumnaGenerada), ColumnaGenerada \= 0, Columna is ColumnaGenerada);
        (columna_aleatoria(Tablero, Columna))
    ), !.
    
% generar una columna con la que la máquina vaya a ganar este turno,
% en el supuesto de evaluar la Columna=8 no encontramos columna válida, devolvemos Columna=0
columna_gana_maquina(_, 8, ColumnaGenerada):- ColumnaGenerada is 0.
columna_gana_maquina(Tablero, Columna, ColumnaGenerada):-
    (
        (
            hacer_movimiento(2, Columna, Tablero, TableroNuevo),    % máquina -> turno par (2)
            jugador_gana(2, Columna, TableroNuevo),
            ColumnaGenerada is Columna
        ); 
        (
            ColumnaNueva is Columna+1,
            columna_gana_maquina(Tablero, ColumnaNueva, ColumnaGenerada),
            !
        )  
    ).

% generar una columna para evitar que el jugador gane este turno,
% en el supuesto de evaluar la Columna=8 no encontramos columna válida, devolvemos Columna=0
columna_no_gana_jugador(_, 8, ColumnaGenerada):-  ColumnaGenerada is 0.
columna_no_gana_jugador(Tablero, Columna, ColumnaGenerada):-
    (
        (
            hacer_movimiento(1, Columna, Tablero, TableroNuevo),    % máquina -> turno impar (1)
            jugador_gana(1, Columna, TableroNuevo),
            ColumnaGenerada is Columna
        ); 
        (
            ColumnaNueva is Columna+1,
            columna_no_gana_jugador(Tablero, ColumnaNueva, ColumnaGenerada),
            !
        )  
    ).

% generar una columna válida pero aleatoria
columna_aleatoria(Tablero, Columna):-
    repeat,
        random(1, 8, Columna),
        movimiento_valido(Columna, Tablero),
    !.