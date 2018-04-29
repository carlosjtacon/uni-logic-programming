:- consult(en_gram).
:- consult(es_gram).
:- consult(en_dic).
:- consult(es_dic).

% Funciones para traducir oraciones en español y oraciones en inglés
traducir_es(ES, EN):- oracion(X, ES, []), oracion_en(X, EN, []).
traducir_en(ES, EN):- oracion_en(X, EN, []), oracion(X, ES, []).

% Frases de ejemplo en español.
test_es_01:- O=[el, hombre, come, una, manzana], write(O), write(" --> "), traducir_es(O, EN), write(EN).
test_es_02:- O=[ellos, comen, manzanas], write(O), write(" --> "), traducir_es(O, EN), write(EN).
test_es_03:- O=[tu, comes, una, manzana, roja], write(O), write(" --> "), traducir_es(O, EN), write(EN).
test_es_04:- O=[juan, ama, a, maria], write(O), write(" --> "), traducir_es(O, EN), write(EN).
test_es_05:- O=[el, gato, grande, come, un, raton, gris], write(O), write(" --> "), traducir_es(O, EN), write(EN).
test_es_06:- O=[juan, estudia, en, la, universidad], write(O), write(" --> "), traducir_es(O, EN), write(EN).
test_es_07:- O=[el, alumno, ama, la, universidad], write(O), write(" --> "), traducir_es(O, EN), write(EN).
test_es_08:- O=[el, perro, persiguio, un, gato, negro, en, el, jardin], write(O), write(" --> "), traducir_es(O, EN), write(EN).
test_es_09:- O=[la, universidad, es, grande], write(O), write(" --> "), traducir_es(O, EN), write(EN).
test_es_10:- O=[el, hombre, que, vimos, ayer, es, mi, vecino], write(O), write(" --> "), traducir_es(O, EN), write(EN).
test_es_11:- O=[el, canario, amarillo, canta, muy, bien], write(O), write(" --> "), traducir_es(O, EN), write(EN).
test_es_12:- O=[juan, toma, un, cafe, y, lee, el, periodico], write(O), write(" --> "), traducir_es(O, EN), write(EN).
test_es_13:- O=[juan, es, delgado, y, maria, es, alta], write(O), write(" --> "), traducir_es(O, EN), write(EN).
test_es_14:- O=[oscar, wilde, escribio, el, fantasma, de, canterville], write(O), write(" --> "), traducir_es(O, EN), write(EN).

% Frases de ejemplo en inglés.
test_en_01:- S=[the, man, eats, an, apple], write(S), write(" --> "), traducir_en(ES, S), write(ES).
test_en_02:- S=[they, eat, some, apples], write(S), write(" --> "), traducir_en(ES, S), write(ES).
test_en_03:- S=[you, eat, a, red, apple], write(S), write(" --> "), traducir_en(ES, S), write(ES).
test_en_04:- S=[john, loves, mary], write(S), write(" --> "), traducir_en(ES, S), write(ES).
test_en_05:- S=[the, big, cat, eats, a, grey, mouse], write(S), write(" --> "), traducir_en(ES, S), write(ES).
test_en_06:- S=[john, studies, at, the, university], write(S), write(" --> "), traducir_en(ES, S), write(ES).
test_en_07:- S=[the, student, loves, university], write(S), write(" --> "), traducir_en(ES, S), write(ES).
test_en_08:- S=[the, dog, chased, a, black, cat, in, the, garden], write(S), write(" --> "), traducir_en(ES, S), write(ES).
test_en_09:- S=[the, university, is, large], write(S), write(" --> "), traducir_en(ES, S), write(ES).
test_en_10:- S=[the, man, we, saw, yesterday, is, my, neighbour], write(S), write(" --> "), traducir_en(ES, S), write(ES). % se puede añadir el "that"
test_en_11:- S=[the, yellow, canary, sings, very, well], write(S), write(" --> "), traducir_en(ES, S), write(ES).
test_en_12:- S=[john, has, a, coffee, and, reads, the, newspaper], write(S), write(" --> "), traducir_en(ES, S), write(ES).
test_en_13:- S=[john, is, thin, and, mary, is, tall], write(S), write(" --> "), traducir_en(ES, S), write(ES).
test_en_14:- S=[oscar, wilde, wrote, the, canterville, ghost], write(S), write(" --> "), traducir_en(ES, S), write(ES).

% Test español (!or -> ;)
test_es:- 
    nl, write("TEST ES 01 "), test_es_01; nl, write("TEST ES 02 "), test_es_02; nl, write("TEST ES 03 "), test_es_03;
    nl, write("TEST ES 04 "), test_es_04; nl, write("TEST ES 05 "), test_es_05; nl, write("TEST ES 06 "), test_es_06;
    nl, write("TEST ES 07 "), test_es_07; nl, write("TEST ES 08 "), test_es_08; nl, write("TEST ES 09 "), test_es_09;
    nl, write("TEST ES 10 "), test_es_10; nl, write("TEST ES 11 "), test_es_11; nl, write("TEST ES 12 "), test_es_12;
    nl, write("TEST ES 13 "), test_es_13; nl, write("TEST ES 14 "), test_es_14.

% Test inglés (!or -> ;)
test_en:- 
    nl, write("TEST EN 01 "), test_en_01; nl, write("TEST EN 02 "), test_en_02; nl, write("TEST EN 03 "), test_en_03;
    nl, write("TEST EN 04 "), test_en_04; nl, write("TEST EN 05 "), test_en_05; nl, write("TEST EN 06 "), test_en_06;
    nl, write("TEST EN 07 "), test_en_07; nl, write("TEST EN 08 "), test_en_08; nl, write("TEST EN 09 "), test_en_09;
    nl, write("TEST EN 10 "), test_en_10; nl, write("TEST EN 11 "), test_en_11; nl, write("TEST EN 12 "), test_en_12;
    nl, write("TEST EN 13 "), test_en_13; nl, write("TEST EN 14 "), test_en_14.
