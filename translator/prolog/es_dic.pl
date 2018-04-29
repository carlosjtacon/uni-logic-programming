
% pronombre(pron(ID), PERSONA, GENERO, NUMERO) --> [PALABRA].
pronombre(pron(personal), 1, _, s) --> [yo].
pronombre(pron(personal), 2, _, s) --> [tu].
pronombre(pron(personal), 3, m, s) --> [el].
pronombre(pron(personal), 3, f, s) --> [ella].
pronombre(pron(personal), 3, o, s) --> [ello].
pronombre(pron(personal), 1, m, p) --> [nosotros].
pronombre(pron(personal), 1, f, p) --> [nosotras].
pronombre(pron(personal), 2, m, p) --> [vosotros].
pronombre(pron(personal), 2, f, p) --> [vosotras].
pronombre(pron(personal), 3, m, p) --> [ellos].
pronombre(pron(personal), 3, f, p) --> [ellas].

% determinante(det(ID), PERSONA, GENERO, NUMERO) --> [PALABRA].
determinante(det(art_det), x, m, s) --> [el].
determinante(det(art_det), x, f, s) --> [la].
determinante(det(art_det), x, m, p) --> [los].
determinante(det(art_det), x, f, p) --> [las].
determinante(det(art_indet), x, m, s) --> [un].
determinante(det(art_indet), x, f, s) --> [una].
determinante(det(art_indet), x, m, p) --> [algunos].
determinante(det(art_indet), x, f, p) --> [algunas].
determinante(det(posesivo), 1, _, s) --> [mi].

% nombre(n(ID), GENERO, NUMERO, COMUN/PROPIO) --> [PALABRA].
nombre(n(n_1), m, s, c) --> [alumno].
nombre(n(n_2), m, s, c) --> [cafe].
nombre(n(n_3), m, s, c) --> [canario].
nombre(n(n_4), m, s, p) --> [el,fantasma,de,canterville].
nombre(n(n_5), m, s, c) --> [fantasma].
nombre(n(n_6), m, s, c) --> [gato].
nombre(n(n_7), m, s, c) --> [hombre].
nombre(n(n_8), m, s, c) --> [jardin].
nombre(n(n_9), m, s, p) --> [juan].
nombre(n(n_10), f, s, c) --> [manzana].
nombre(n(n_11), f, p, c) --> [manzanas].
nombre(n(n_12), f, s, p) --> [maria].
nombre(n(n_13), m, s, c) --> [periodico].
nombre(n(n_14), m, s, c) --> [perro].
nombre(n(n_15), m, s, c) --> [raton].
nombre(n(n_16), f, s, c) --> [universidad].
nombre(n(n_17), m, s, c) --> [vecino].
nombre(n(n_18), m, s, p) --> [oscar,wilde].

% adjetivo(adj(ID), GENERO, NUMERO) --> [PALABRA].
adjetivo(adj(a_1), f, s) --> [alta].
adjetivo(adj(a_2), m, s) --> [amarillo].
adjetivo(adj(a_3), m, s) --> [delgado].
adjetivo(adj(a_4), _, s) --> [grande].
adjetivo(adj(a_5), _, s) --> [gris].
adjetivo(adj(a_6), m, s) --> [negro].
adjetivo(adj(a_7), m, s) --> [rojo].
adjetivo(adj(a_7), f, s) --> [roja].

% verbo(v(ID), TIEMPO, PERSONA, NUMERO) --> [PALABRA].
verbo(v(v_1), presente, 3, s) --> [ama].
verbo(v(v_2), presente, 3, s) --> [canta].
verbo(v(v_3), presente, 3, s) --> [come].
verbo(v(v_4), presente, 2, s) --> [comes].
verbo(v(v_5), presente, 3, p) --> [comen].
verbo(v(v_6), presente, 3, s) --> [es].
verbo(v(v_7), pasado, 3, s) --> [escribio].
verbo(v(v_8), presente, 3, s) --> [estudia].
verbo(v(v_9), presente, 3, s) --> [lee].
verbo(v(v_10), pasado, 3, s) --> [persiguio].
verbo(v(v_11), presente, 3, s) --> [toma].
verbo(v(v_12), pasado, 1, p) --> [vimos].

% preposicion(prep(ID)) --> [PALABRA]
preposicion(prep(a)) --> [a].
preposicion(prep(en)) --> [en].
preposicion(prep(de)) --> [de].

% conjuncion(conj(ID), TIPO) --> [PALABRA]
conjuncion(conj(que), subordinada) --> [que].
conjuncion(conj(y), coordinada) --> [y].

% adverbio(prep(ID)) --> [PALABRA]
adverbio(adv(ayer)) --> [ayer].
adverbio(adv(bien)) --> [bien].
adverbio(adv(muy)) --> [muy].