
% en castellano tenemos sujeto omitido que podemos usar
oracion(o(GV)) --> g_verbal(GV, _, _).
% las oraciones más simples se componen solamente de un grupo nominal sujeto y un grupo verbal predicado que concuerdan en persona y número
oracion(o(GN, GV)) --> g_nominal(GN, Persona, _, Numero), g_verbal(GV, Persona, Numero).
% se puede concatenar una oración coordinada a una oración simple
oracion(o(GN, GV, OC)) --> g_nominal(GN, Persona, _, Numero), g_verbal(GV, Persona, Numero), o_conjuntiva(OC).

% la oración de relativo se compone de su conjunción subordinada más una oración nueva
o_relativo(or(Conj, O)) --> conjuncion(Conj, subordinada), oracion(O).
% al igual que la oración de relativo, la cnonjuntiva se compone de una conjunción coordinada mas otra oración
o_conjuntiva(oc(Conj, O)) --> conjuncion(Conj, coordinada), oracion(O).

% el grupo nominal puede ser simplemente un grupo nominal básico simple
g_nominal(gn(GNB), Persona, Genero, Numero) --> g_nominal_basico(GNB, Persona, Genero, Numero).
% si el grupo nominal no es simple es porque tiene una oración subordinada como relativo
g_nominal(gn(GNB, OR), Persona, Genero, Numero) --> g_nominal_basico(GNB, Persona, Genero, Numero), o_relativo(OR).

% un frupo nominal puede estar formado solo por un pronombre personal, en este caso el grupo tendrá las propiedades del pronombre
g_nominal_basico(gnb(Pron), Persona, Genero, Numero) --> pronombre(Pron, Persona, Genero, Numero).
% un grupo nominal puede estar formado solo por un nombre, en este caso adoptará el género y número pero siempre será una tercera persna
g_nominal_basico(gnb(Nom), 3, Genero, Numero) --> nombre(Nom, Genero, Numero, _).
% podemos concatenar un determinante que concuerde, si el grupo nominal esta formado solo por un nombre
% g_nominal_basico(gnb(Nom), 3, Genero, Numero) --> determinante(det(art_det), _, Genero, Numero), nombre(Nom, Genero, Numero, c). % ** Conflictiva en algunos casos.
% el grupo nominal común es un determinante y un nombre, que tienen concordancia en género y número 
g_nominal_basico(gnb(Det, Nom), 3, Genero, Numero) --> determinante(Det, _, Genero, Numero), nombre(Nom, Genero, Numero, _).
% si el grupo nominal contiene un grupo adjetival este se situará al final (al contrario que en inglés)
g_nominal_basico(gnb(Det, Nom, GA), 3, Genero, Numero) --> determinante(Det, _, Genero, Numero), nombre(Nom, Genero, Numero, _), g_adjetival(GA, Genero, Numero).

% un grupo preposicional más genérico está formado por una preposición que precede a un grupo nominal
g_preposicional(gp(Prep, GN)) --> preposicion(Prep), g_nominal(GN, _, _, _).

% un grupo verbal puede ser solamente un verbo que tenga significado por sí mismo
g_verbal(gv(Ver), Persona, Numero) --> verbo(Ver, _, Persona, Numero).
% normalmente un verbo tendrá un grupo nominal que lo complemente
g_verbal(gv(Ver, GN), Persona, Numero) --> verbo(Ver, _, Persona, Numero), g_nominal(GN, _, _, _).
% también puede ser complementado por un grupo preposicional
g_verbal(gv(Ver, GP), Persona, s) --> verbo(Ver, _, Persona, s), g_preposicional(GP).
% o ser complementado por ambos grupos (nominal / preposicional)
g_verbal(gv(Ver, GN, GP), Persona, Numero) --> verbo(Ver, _, Persona, Numero), g_nominal(GN, _, _, _), g_preposicional(GP).
% puede ser solamente verbo y adjetivo
g_verbal(gv(Ver, GA), Persona, Numero) --> verbo(Ver, _, Persona, Numero), g_adjetival(GA, _, Numero).
% o verbo y grupo adverbial
g_verbal(gv(Ver, GA), Persona, Numero) --> verbo(Ver, _, Persona, Numero), g_adverbial(GA).

% el grupo adjetival puede ser un adjetivo simple
g_adjetival(gadj(Adj), Genero, Numero) --> adjetivo(Adj, Genero, Numero).
% el adjetivo puede ser modificado por un grupo adverbial
g_adjetival(gadj(GA, Adj), Genero, Numero) --> g_adverbial(GA), adjetivo(Adj, Genero, Numero).

% el grupo adverbial puede ser solo un adverbio
g_adverbial(gadv(Adv)) --> adverbio(Adv).
% o estar compuesto por varios adverbios que encontramos de forma recursiva
g_adverbial(gadv(Adv|GA)) --> adverbio(Adv), g_adverbial(GA).
