persona(ernesto).
persona(teresa).
persona(carlos).
persona(ana).
persona(lucia).
persona(sofia).
persona(mateo).
persona(valeria).
persona(andres).
persona(ricardo).
persona(daniel).
persona(daniell).
persona(laura).
persona(carmen).
persona(miguel).
persona(felipe).
persona(rosa).


vive_en(ernesto, valle_verde).
vive_en(sofia, capital).

trabaja_en(ernesto, profesor).
trabaja_en(teresa, enfermera).

padre(ernesto, carlos).
padre(ernesto, ana).
padre(ernesto, lucia).

madre(teresa, ana).
madre(teresa, lucia).
madre(teresa, carlos).

trabaja_en(carlos, ing_civil).
casado_con(ernesto, teresa).
casado(carlos, sofia).
trabaja_en(sofia, arquitecta).

padre(carlos, mateo).
padre(carlos, valeria).

madre(sofia, mateo).
madre(sofia, valeria).

hijo(carlos, ernesto).
hijo(ana, ernesto).
hijo(lucia, ernesto).

hijo(mateo, carlos).
hijo(valeria, carlos).

trabaja_en(ana, profesora).

madre(ana, andres).

hijo(andres, ana).

vive_en(ana, valle_verde).
vive_en(lucia, capital).
trabaja_en(lucia, estudiante).


sobrino(mateo, lucia).
sobrino(valeria, lucia).

sobrino(andres, lucia).
sobrino(andres, carlos).

sobrino(mateo, ana).
sobrino(valeria, ana).

primo(carlos, daniel).
primo(ana, daniel).
primo(luica, daniel).

amigo(carlos, ricardo).
vive_en(carlos,capital).

trabaja_en(ricardo, abogado).

vive_en(ricardo, capital).

esposo(ricardo, laura).

padre(ricardo, daniell).
madre(laura, daniell).

hijo(daniell, ricardo).
hijo(daniell, laura).

amigo(daniell, mateo).

vive_en(miguel, valle_verde).

hermano(miguel, ernesto).

trabaja_en(miguel, agricultor).
trabaja_en(laura, bibliotecaria).
casado_con(miguel, rosa).

trabaja_en(rosa, vendedor).

hijo(fernanda, miguel).

hijo(fernanda, rosa).

madre(rosa, fernanda).
padre(rosa, fernanda).

trabaja_en(fernanda, estudiante).

primo(fernanda, andres).

primo(fernanda, mateo).

primo(fernanda, valeria).

amigo(teresa, carmen).

trabaja_en(carmen, partera).

nieto(isabel, carmen).
trabaja_en(isabel, estudiante).

amigo(felipe, miguel).
trabaja_en(felipe, vendedor).

padre(felipe, joaquin).

amigo(joaquin, andres).


abuelo(X) :- nieto(Y,X).

abuelo(X) :- padre(Y,Z) , padre(X,Y).

abuelo(X) :- padre(X,Y), madre(Y,Z).

abuelo(X) :- madre(X,Y), padre(Y,Z).

abuelo(X) :- madre(X,Y), madre(Y,Z).

hermano(X,Y) :- padre(P,X), padre(P,Y), X\=Y.
hermano(X,Y) :- madre(M,X), madre(M,Y), X\=Y.

tio(X) :- sobrino(Y,X).

primo(X,Y) :- hermano(A,B), (padre(A,X),padre(B,Y)).
primo(X,Y) :- primo(A,B), (hijo(X,A),hijo(Y,B)).

amigo_primo(X,Y) :- primo(A,Y), (amigo(X,Y)).

% CONSULTAS

hijo(X,ernesto).
abuelo(Quien,mateo).
hermano(_,_).

mostrar_madres :- madre(X,_), write('Madre: '), write(X),nl,fail.
mostrar_madres.

amigo(mateo,daniel);amigo(daniel,mateo).
primo(andres,fernanda); primo(fernanda,andres).

vive_en(X,Y) :- hijo(X,A), vive_en(A,Y), A\=ernesto.
vive_en(X,Y) :- padre(A,X), vive_en(A,Y),  A\=ernesto.

not_padre_madre(X) :- not(padre(X,_)),  not(madre(X,_)).