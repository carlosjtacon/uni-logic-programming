% consulta de los archivos auxiliares
:- consult(practica1_conocimiento).
:- consult(practica1_procedimientos).
:- consult(practica1_inteligencia_artificial).

% procedimiento principal, se encarga de registrar el modo de juego, generar el tablero
% de juego vacío inicial, escribir ese tablero y pasa el turno al primer jugador
jugar:-
    write("¿Desea jugar contra la máquina [1|0]?"), nl,
    leer_maquina(Maquina),
    write("El tablero inicial comienza vacío:"), nl,
    generar_tablero_inicial(Tablero),
    escribir_tablero(Tablero),
    jugando(0, Tablero, Maquina).

% turno del jugador, independiente del jugador al que le toque (identificado 
% por el turno par o impar). pasa turno a la máquina o al siguiente jugador.
jugando(Turno, Tablero, Maquina):- 
    incrementar_turno(Turno, TurnoActual),
    write("Turno "), write(TurnoActual), imprime_jugador(TurnoActual), nl,
    write("Inserte una columna [1-7]: "), nl,
    leer_columna(Columna, Tablero),
    hacer_movimiento(TurnoActual, Columna, Tablero, TableroNuevo),
    escribir_tablero(TableroNuevo),
    (
        (jugador_gana(TurnoActual, Columna, TableroNuevo), write("Gana"), imprime_jugador(TurnoActual));
        (empate(TurnoActual), write("Se ha producido empate, fin del juego."), nl);
        (Maquina is 1, impar(TurnoActual), jugando_maquina(TurnoActual, TableroNuevo)); 
        jugando(TurnoActual, TableroNuevo, Maquina)
    ).

% turno de la máquina, solo si se ha seleccionado la opción en los turnos pares, 
% genera su movimiento en el tablero y devuelve el turno al jugador
jugando_maquina(Turno, Tablero):- 
    incrementar_turno(Turno, TurnoActual),
    write("Turno "), write(TurnoActual), write(" - Máquina"), nl,
    generar_columna_maquina(Columna, Tablero), write("Columna generada: "), write(Columna), nl,
    hacer_movimiento(TurnoActual, Columna, Tablero, TableroNuevo),
    escribir_tablero(TableroNuevo),
    (
        (jugador_gana(TurnoActual, Columna, TableroNuevo), write("Gana - Máquina"));
        (empate(TurnoActual), write("Se ha producido empate, fin del juego."), nl);
        jugando(TurnoActual, TableroNuevo, 1)
    ).