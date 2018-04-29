
% una oración puede ser solo un conjunto verbal, solo en algunas ocasiones en inglés (para concatenar conjuntivas)
oracion_en(o(GV)) --> g_verbal_en(GV, _, _).
% normalmente el pronombre será obligatorio para frases que solo tengan grupo verbal, concordancia Persona y Numero
oracion_en(o(GV)) --> pronombre_en(pron(personal), Persona, _, Numero), g_verbal_en(GV, Persona, Numero).
% las oraciones más simples se componen solamente de un grupo nominal sujeto y un grupo verbal predicado
oracion_en(o(GN, GV)) --> g_nominal_en(GN, Persona, _, Numero), g_verbal_en(GV, Persona, Numero).
% se puede concatenar una oración coordinada a una oración simple
oracion_en(o(GN, GV, OC)) --> g_nominal_en(GN, Persona, _, Numero), g_verbal_en(GV, Persona, Numero), o_conjuntiva_en(OC).

% la oración de relativo en inglés tiene la posibilidad de omitir la conjunción sea cual sea
o_relativo_en(or(_, O)) --> oracion_en(O).
% también está la posibilidad de no omitir esta conjunción
o_relativo_en(or(Conj, O)) --> conjuncion_en(Conj, subordinada), oracion_en(O).
% la oración conjuntiva se compone de una conjunción a la que se concatena otra oración completa, esta se concatenará al final de una oración 
o_conjuntiva_en(oc(Conj, O)) --> conjuncion_en(Conj, coordinada), oracion_en(O).

% el grupo nominal puede ser simplemente un grupo nominal básico simple
g_nominal_en(gn(GNB), Persona, Genero, Numero) --> g_nominal_basico_en(GNB, Persona, Genero, Numero).
% si el grupo nominal no es simple es porque tiene una oración subordinada como relativo
g_nominal_en(gn(GNB, OR), Persona, Genero, Numero) --> g_nominal_basico_en(GNB, Persona, Genero, Numero), o_relativo_en(OR).

% un frupo nominal puede estar formado solo por un pronombre personal, en este caso el grupo tendrá las propiedades del pronombre
g_nominal_basico_en(gnb(Pron), Persona, Genero, Numero) --> pronombre_en(Pron, Persona, Genero, Numero).
% si el grupo nominal consta solo de un nombre común plural (ej. ellos comen manzanas) se puede concatenar un determinante para que tenga una estructura más natural
g_nominal_basico_en(gnb(Nom), 3, _, p) --> determinante_en(det(art_indet), _, _, p), nombre_en(Nom, _, p, c).
% un grupo nominal puede estar formado solo por un nombre, en este caso adoptará el número pero siempre será una tercera persna
g_nominal_basico_en(gnb(Nom), 3, _, Numero) --> nombre_en(Nom, _, Numero, _).
% el grupo nominal común es un determinante y un nombre, que tienen concordancia en número además el determinante tiene concordar con la primera letra del nombre
g_nominal_basico_en(gnb(Det, Nom), 3, _, Numero) --> determinante_en(Det, _, EmpiezaPor, Numero), nombre_en(Nom, EmpiezaPor, Numero, _).
% si hay adjetivo este va antes del nombre, así que la concordancia en número será determinante-nombre pero la concordancia para la primera letra será con el adjetivo 
g_nominal_basico_en(gnb(Det, Nom, GA), 3, _, Numero) --> determinante_en(Det, _, EmpiezaPor, Numero), g_adjetival_en(GA, EmpiezaPor), nombre_en(Nom, _, Numero, _).

% un grupo preposicional en inglés puede omitir la preposición "a" (ej. john loves mary)
g_preposicional_en(gp(prep(a), GN)) --> g_nominal_en(GN, _, _, s). % ** Conflictiva en algunos casos.
% normalmente esta preposición no será omitida
g_preposicional_en(gp(Prep, GN)) --> preposicion_en(Prep), g_nominal_en(GN, _, _, _).

% un grupo verbal puede ser solamente un verbo que tenga significado por sí mismo
g_verbal_en(gv(Ver), Persona, Numero) --> verbo_en(Ver, _, Persona, Numero).
% normalmente un verbo tendrá un grupo nominal que lo complemente
g_verbal_en(gv(Ver, GN), Persona, Numero) --> verbo_en(Ver, _, Persona, Numero), g_nominal_en(GN, _, _, _).
% también puede ser complementado por un grupo preposicional
g_verbal_en(gv(Ver, GP), Persona, Numero) --> verbo_en(Ver, _, Persona, Numero), g_preposicional_en(GP).
% o ser complementado por ambos grupos (nominal / preposicional)
g_verbal_en(gv(Ver, GN, GP), Persona, Numero) --> verbo_en(Ver, _, Persona, Numero), g_nominal_en(GN, _, _, _), g_preposicional_en(GP).
% puede ser solamente verbo y adjetivo
g_verbal_en(gv(Ver, GA), Persona, Numero) --> verbo_en(Ver, _, Persona, Numero), g_adjetival_en(GA, _).
% o verbo y grupo adverbial
g_verbal_en(gv(Ver, GA), Persona, Numero) --> verbo_en(Ver, _, Persona, Numero), g_adverbial_en(GA).

% el grupo adjetival puede ser un adjetivo simple
g_adjetival_en(gadj(Adj), EmpiezaPor) --> adjetivo_en(Adj, EmpiezaPor).
% el adjetivo puede ser modificado por un grupo adverbial
g_adjetival_en(gadj(GA, Adj), _) --> g_adverbial_en(GA), adjetivo_en(Adj, _).

% el grupo adverbial puede ser solo un adverbio
g_adverbial_en(gadv(Adv)) --> adverbio_en(Adv).
% o estar compuesto por varios adverbios que encontramos de forma recursiva
g_adverbial_en(gadv(Adv|GA)) --> adverbio_en(Adv), g_adverbial_en(GA).
