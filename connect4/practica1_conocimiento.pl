% ya que el tablero es de 6 filas x 7 columnas, la columna 
% introducida será válida estando en el rango 1-7
columna_valida(Columna):- integer(Columna), Columna >= 1, Columna =< 7.

% métodos para comprobar la paridad de un número dado
par(Numero):- integer(Numero), 0 is mod(Numero, 2).
impar(Numero):- integer(Numero), 1 is mod(Numero, 2).

% el empate se produce cuando se agotan todas las fichas del juego 21*2
empate(Turno):- Turno is 42.

% el jugdor actual gana si acumula 4 fichas en diagonal, columna o fila
jugador_gana(Turno, Columna, Tablero):- 
    ficha_jugador(Turno, Ficha),                            % necesitamos saber qué ficha evaluar F=X/F=O
    profundidad_tablero(Tablero, Columna, 0, Profundidad),  % necesitamos calcular la profundidad en la columna
    nth0(Profundidad, Tablero, Fila),                       % obtenemos la lista de la fila a evaluar con la profundidad
    (
        gana_filas(Fila, Ficha);
        gana_columnas(Tablero, Columna, Ficha);
        gana_diagonal_des(Tablero, Columna, Profundidad, Ficha);
        gana_diagonal_asc(Tablero, Columna, Profundidad, Ficha)
    ).

% comprobación de si hay 4 fichas de un tipo en fila
gana_filas(Fila, Ficha):- contar_filas(Fila, Ficha, 0, Resultado), Resultado is 4.
contar_filas([], _, Contador, Resultado):- 
    Resultado is Contador.  % ya no quedan filas que evaluar, se devuelve el contador actual, 
                            % no tiene por que ser el contador máximo, igual para resto de casos
contar_filas([Cabeza|Cola], Ficha, Contador, Resultado):- 
    (
        (Contador is 4, Resultado is Contador);                 % cuando llega a contar 4 fichas seguidas para el proceso
        (
            (
                (Cabeza = Ficha, ContadorNuevo is Contador+1);  % si la ficha actual coincide, incrementamos contador
                (ContadorNuevo is 0)                            % si no coincide reseteamos contador
            ),
            contar_filas(Cola, Ficha, ContadorNuevo, Resultado), !
        )
    ).

% comprobación si hay 4 fichas de un tipo en columna, proceso muy similar a filas, pero recorriendo la posición
% dada con la columna de nth1(columna) del tablero, en vez de la fila
gana_columnas(Tablero, Columna, Ficha):- contar_columnas(Tablero, Columna, Ficha, 0, Resultado), Resultado is 4.
contar_columnas([], _, _, Contador, Resultado):- Resultado is Contador.
contar_columnas([PrimeraFila|RestoFilas], Columna, Ficha, Contador, Resultado):-
    (
        (Contador is 4, Resultado is Contador);
        (
            (
                (nth1(Columna, PrimeraFila, Casilla), Casilla = Ficha, ContadorNuevo is Contador+1); 
                (ContadorNuevo is 0)
            ),
            contar_columnas(RestoFilas, Columna, Ficha, ContadorNuevo, Resultado), !
        )
    ).

% comprobación si hay 4 fichas del mismo tipo en diagonal descendente [de izquierda a derecha]
% primero calculamos la primera posicion de la diagonal a partir de la posicion de la ultima jugada
% contamos repeticiones de la ficha hacia abajo + derecha, hasta llegar a la última fila+1 [6] o última columna+1 [8]
gana_diagonal_des(Tablero, Columna, Profundidad, Ficha):- 
    inicio_diagonal_des(Columna, Profundidad, ColumnaInicio, ProfundidadInicio),
    contar_diagonal_des(Tablero, ColumnaInicio, ProfundidadInicio, Ficha, 0, Resultado),
    Resultado is 4.
contar_diagonal_des(_, 8, _, _, Contador, Resultado):- Resultado is Contador.
contar_diagonal_des(_, _, 6, _, Contador, Resultado):- Resultado is Contador.
contar_diagonal_des(Tablero, Columna, Profundidad, Ficha, Contador, Resultado):-
    (
        (Contador is 4, Resultado is Contador);
        (
            (
                (nth0(Profundidad, Tablero, Fila), nth1(Columna, Fila, Casilla), Casilla = Ficha, ContadorNuevo is Contador+1); 
                (ContadorNuevo is 0)
            ),
            ColumnaNueva is Columna+1,
            ProfundidadNueva is Profundidad+1,
            contar_diagonal_des(Tablero, ColumnaNueva, ProfundidadNueva, Ficha, ContadorNuevo, Resultado), !
        )
    ). 

% comprobación si hay 4 fichas del mismo tipo en diagonal ascendente [de izquierda a derecha]
% primero calculamos la primera posicion de la diagonal a partir de la posicion de la ultima jugada
% contamos repeticiones de la ficha hacia abajo + izquierda, hasta llegar a la última fila+1 [6] o primera columna-1 [0]
gana_diagonal_asc(Tablero, Columna, Profundidad, Ficha):- 
    inicio_diagonal_asc(Columna, Profundidad, ColumnaInicio, ProfundidadInicio),
    contar_diagonal_asc(Tablero, ColumnaInicio, ProfundidadInicio, Ficha, 0, Resultado),
    Resultado is 4.
contar_diagonal_asc(_, 0, _, _, Contador, Resultado):- Resultado is Contador.
contar_diagonal_asc(_, _, 6, _, Contador, Resultado):- Resultado is Contador.
contar_diagonal_asc(Tablero, Columna, Profundidad, Ficha, Contador, Resultado):-
    (
        (Contador is 4, Resultado is Contador);
        (
            (
                (nth0(Profundidad, Tablero, Fila), nth1(Columna, Fila, Casilla), Casilla = Ficha, ContadorNuevo is Contador+1); 
                (ContadorNuevo is 0)
            ),
            ColumnaNueva is Columna-1,
            ProfundidadNueva is Profundidad+1,
            contar_diagonal_asc(Tablero, ColumnaNueva, ProfundidadNueva, Ficha, ContadorNuevo, Resultado), !
        )
    ). 