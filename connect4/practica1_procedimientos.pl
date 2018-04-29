% procedimiento que genera una lista de tamaño específico de una repetición de elementos
lista_repetidos(1, Elemento, [Elemento]).
lista_repetidos(Tamano, Elemento, [Elemento|Cola]):- 
    TamanoNuevo is Tamano-1, lista_repetidos(TamanoNuevo, Elemento, Cola).

% procedimiento que escribe el contenido de una lista por pantalla
escribir_lista([]):- nl.
escribir_lista([Cabeza|Cola]):- write(Cabeza), escribir_lista(Cola).

% procedimiento que escribe el contenido de una lista por pantalla
% añadiendo un separador "|" antes y después de cada elemento de esta
escribir_lista_separador([]):- write("|"), nl.
escribir_lista_separador([Cabeza|Cola]):- write("|"), write(Cabeza), escribir_lista_separador(Cola).

% procedimiento que escribe las casillas del tablero de juego 
% añadiendo una fila de separadores entre fila y fila de juego
escribir_casillas([]):- nl.
escribir_casillas([Cabeza|Cola]):-
    escribir_lista_separador(Cabeza),
    lista_repetidos(15, "-", ListaRepetidos), 
    escribir_lista(ListaRepetidos),
    escribir_casillas(Cola).

% procedimiento que escribe el tablero actual de juego, cabecera + casillas
escribir_tablero(Tablero):-
    escribir_lista_separador(["1", "2", "3", "4", "5", "6", "7"]),
    lista_repetidos(15, "-", ListaRepetidos), 
    escribir_lista(ListaRepetidos),
    escribir_casillas(Tablero).

% procedimiento que genera un tablero de juego vacío
generar_tablero_inicial(Tablero):- lista_repetidos(7, " ", Fila), lista_repetidos(6, Fila, Tablero), !.

% procedimiento que lee un valor por pantalla hasta que sea válido y correcto
leer_columna(Columna, Tablero):- 
    repeat,
        read(Columna),
        columna_valida(Columna),
        movimiento_valido(Columna, Tablero),
    !.

% procedimiento que lee un valor por pantalla hasta que sea válido
leer_maquina(Maquina):- 
    repeat,
        read(Maquina),
        (Maquina is 0 ; Maquina is 1),
    !.

% procedimiento que imprime el número de jugador (1 o 2)
imprime_jugador(Turno):- (impar(Turno), write(" - Jugador 1")) ; (par(Turno), write(" - Jugador 2")).

% procedimiento que imprime la ficha correspondiente a cada jugador: Jugador1=X | Jugador2=O
ficha_jugador(Turno, Ficha):- (impar(Turno), Ficha = "X") ; (par(Turno), Ficha = "O").

% procedimiento que incrementa el turno en 1
incrementar_turno(Turno, NuevoTurno):- NuevoTurno is Turno+1.

% procedimiento que comprueba la profundidad del tablero en la columna elegida devuelve el numero
% de la última fila con valor no vacío, el numero de fila es 0 para la primera y 5 para la última
profundidad_tablero([], _, Profundidad, ProfundidadFinal):- ProfundidadFinal is Profundidad.
profundidad_tablero([PrimeraFila|RestoTablero], Columna, Profundidad, ProfundidadFinal):- 
    (
        (nth1(Columna, PrimeraFila, CasillaValor), CasillaValor \= " ", ProfundidadFinal is Profundidad); 
        (ProfundidadNueva is Profundidad+1, profundidad_tablero(RestoTablero, Columna, ProfundidadNueva, ProfundidadFinal))
    ), !.

% procedimiento que cambia el valor de una casilla dada en el tablero a partir de la profundidad de la columna, 
% cambiando el valor en esta posición y devolviendo el tablero resultante en 'TableroNuevo'
cambiar_casilla(Tablero, Columna, Valor, TableroNuevo):- 
    profundidad_tablero(Tablero, Columna, 0, Profundidad),
    nth1(Profundidad, Tablero, Fila),
    Columna0 is Columna-1,
    Profundidad0 is Profundidad-1,
    reemplazar(Fila, Columna0, Valor, FilaNueva),
    reemplazar(Tablero, Profundidad0, FilaNueva, TableroNuevo),
    !.

% reemplazar una posicion de una lista con un nuevo valor recorre la lista hasta llegar al caso
% en el que la cabeza sea la posicion a reemplazar, se reemplaza y luego se reconstruye recursivamente
reemplazar([_|Cola], 0, Valor, [Valor|Cola]).
reemplazar([Cabeza|Cola], Posicion, Valor, [Cabeza|NuevaCola]):- 
    Posicion > 0, PosicionNueva is Posicion-1, 
    reemplazar(Cola, PosicionNueva, Valor, NuevaCola),
    !.

% procedimiento que comprueba si un movimiento es válido en relación con el tablero actual
% lo que es lo mismo, que aún haya filas disponibles para una columna dada
movimiento_valido(Columna, Tablero):- profundidad_tablero(Tablero, Columna, 0, Profundidad), Profundidad > 0.

% procedimiento que añade una ficha a la columna seleccionada, para un jugador específico
hacer_movimiento(Turno, Columna, Tablero, TableroNuevo):- 
        ficha_jugador(Turno, Profundidad),
        cambiar_casilla(Tablero, Columna, Profundidad, TableroNuevo).

% calcula la casilla de inicio de una diagonal desdecendente: ColumnaInicio, ProfundidadInicio
% recorrerá el tablero en diagonal hasta llegar a la primera fila [0] o primera columna [1] 
inicio_diagonal_des(Columna, Profundidad, ColumnaInicio, ProfundidadInicio):- 
    (
        (Columna is 1, ColumnaInicio is 1, ProfundidadInicio is Profundidad);
        (Profundidad is 0, ColumnaInicio is Columna, ProfundidadInicio is Profundidad);
        (
            ColumnaAnterior is Columna-1,
            ProfundidadAnterior is Profundidad-1,
            inicio_diagonal_des(ColumnaAnterior, ProfundidadAnterior, ColumnaInicio, ProfundidadInicio)
        )
    ), !.

% calcula la casilla de inicio de una diagonal ascendente: ColumnaInicio, ProfundidadInicio
% recorrerá el tablero en diagonal hasta llegar a la primera fila [0] o ultima columna [7] 
inicio_diagonal_asc(Columna, Profundidad, ColumnaInicio, ProfundidadInicio):- 
    (
        (Columna is 7, ColumnaInicio is 7, ProfundidadInicio is Profundidad);
        (Profundidad is 0, ColumnaInicio is Columna, ProfundidadInicio is Profundidad);
        (
            ColumnaSiguiente is 1+Columna,
            ProfundidadAnterior is Profundidad-1,
            inicio_diagonal_asc(ColumnaSiguiente, ProfundidadAnterior, ColumnaInicio, ProfundidadInicio)
        )
    ), !.