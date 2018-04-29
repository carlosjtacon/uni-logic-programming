
% pronombre_en(pron(ID), PERSONA, GENERO, NUMERO) --> [PALABRA].
pronombre_en(pron(personal), 1, _, s) --> [i].
pronombre_en(pron(personal), 2, _, s) --> [you].
pronombre_en(pron(personal), 3, m, s) --> [he].
pronombre_en(pron(personal), 3, f, s) --> [she].
pronombre_en(pron(personal), 3, o, s) --> [it].
pronombre_en(pron(personal), 1, _, p) --> [we].
pronombre_en(pron(personal), 2, _, p) --> [you].
pronombre_en(pron(personal), 3, _, p) --> [they].

% determinante_en(det(ID), PERSONA, EMPIEZA POR, NUMERO) --> [PALABRA].
determinante_en(det(art_det), x, _, s) --> [the].
determinante_en(det(art_indet), x, c, s) --> [a]. 
determinante_en(det(art_indet), x, v, s) --> [an].
determinante_en(det(art_indet), x, _, p) --> [some].
determinante_en(det(posesivo), 1, _, s) --> [my].

% nombre_en(n(ID), EMPIEZA POR, NUMERO, COMUN/PROPIO) --> [PALABRA].
nombre_en(n(n_1), c, s, c) --> [student].
nombre_en(n(n_2), c, s, c) --> [coffee].
nombre_en(n(n_3), c, s, c) --> [canary].
nombre_en(n(n_4), c, s, p) --> [the,canterville,ghost].
nombre_en(n(n_5), c, s, c) --> [ghost].
nombre_en(n(n_6), c, s, c) --> [cat].
nombre_en(n(n_7), c, s, c) --> [man].
nombre_en(n(n_8), c, s, c) --> [garden].
nombre_en(n(n_9), c, s, p) --> [john].
nombre_en(n(n_10), v, s, c) --> [apple].
nombre_en(n(n_11), v, p, c) --> [apples].
nombre_en(n(n_12), c, s, p) --> [mary].
nombre_en(n(n_13), c, s, c) --> [newspaper].
nombre_en(n(n_14), c, s, c) --> [dog].
nombre_en(n(n_15), c, s, c) --> [mouse].
nombre_en(n(n_16), v, s, c) --> [university].
nombre_en(n(n_17), c, s, c) --> [neighbour].
nombre_en(n(n_18), v, s, p) --> [oscar,wilde].

% adjetivo_en(adj(ID), EMPIEZA POR) --> [PALABRA].
adjetivo_en(adj(a_1), c) --> [tall].
adjetivo_en(adj(a_2), c) --> [yellow].
adjetivo_en(adj(a_3), c) --> [thin].
adjetivo_en(adj(a_4), c) --> [big].
adjetivo_en(adj(a_4), c) --> [large].
adjetivo_en(adj(a_5), c) --> [grey].
adjetivo_en(adj(a_6), c) --> [black].
adjetivo_en(adj(a_7), c) --> [red].


% verbo_en(v(ID), TIEMPO, PERSONA, NUMERO) --> [PALABRA].
verbo_en(v(v_1), presente, 3, s) --> [loves].
verbo_en(v(v_2), presente, 3, s) --> [sings].
verbo_en(v(v_3), presente, 3, s) --> [is,eating].
verbo_en(v(v_4), presente, 2, s) --> [are,eating].
verbo_en(v(v_5), presente, 3, p) --> [are,eating].
verbo_en(v(v_6), presente, 3, s) --> [is].
verbo_en(v(v_7), pasado, 3, s) --> [wrote].
verbo_en(v(v_8), presente, 3, s) --> [studies].
verbo_en(v(v_9), pasado, 3, s) --> [reads].
verbo_en(v(v_10), pasado, 3, s) --> [chased].
verbo_en(v(v_11), presente, 3, s) --> [is,having].
verbo_en(v(v_12), pasado, 1, p) --> [saw].

% preposicion_en(prep(ID)) --> [PALABRA]
preposicion_en(prep(en)) --> [at].
preposicion_en(prep(en)) --> [in].

% conjuncion_en(conj(ID), TIPO) --> [PALABRA]
conjuncion_en(conj(que), subordinada) --> [that].
conjuncion_en(conj(y), coordinada) --> [and].

% adverbio_en(prep(ID)) --> [PALABRA]
adverbio_en(adv(ayer)) --> [yesterday].
adverbio_en(adv(bien)) --> [well].
adverbio_en(adv(muy)) --> [very].