%Define hechos de actividades
cocina(ana).
estudia(juan).
trabaja(pedro).
trabaja(sofia).
estudia(maria).
estudia(sofia).
juega(pedro).
descansa(maria).
descansa(juan).

%Define hechos de amistad
amigo(juan,ana).
amigo(juan,maria).

%Define hechos de familia
hermana(ana,pedro).
prima(maria,sofia).

%Define hecho de rutinas semanales
%Define hechos de actividades
cocina(ana).
estudia(juan).
trabaja(pedro).
trabaja(sofia).
estudia(maria).
estudia(sofia).
juega(pedro).
descansa(maria).
descansa(juan).

%Define hechos de amistad
amigo(juan,ana).
amigo(juan,maria).

%Define hechos de familia
hemana(ana,pedro).
prima(maria,sofia).

%Define hecho de rutinas dsemanales
rutina(ana, cocinar, todos_dias).
rutina(juan, estudiar, entre_semana).
rutina(pedro, trabajar, entre_semana).
rutina(pedro, jugar, sabado).
rutina(sofia, estudiar, noches).
rutina(sofia, trabajar, todos_dias).
rutina(maria, estudiar, entre_semana).
rutina(maria, descansar, domingo).  
rutina(juan, descansar, fin_semana).

%Regla actividad(X) 
actividad(X) :- cocina(X).
actividad(X) :- estudia(X).
actividad(X) :- trabaja(X).
actividad(X) :- juega(X).
actividad(X) :- descansa(X).

% Regla descansa(X) 
descansa(X) :- \+ actividad(X).

%Regla para verificar parentesco directo
parentesco(X,Y) :- hermana(X,Y).
parentesco(X,Y) :- hermana(Y,X).
parentesco(X,Y) :- prima(X,Y).
parentesco(X,Y) :- prima(Y,X).

% Amistad
amistad(X,Y) :- amigo(X,Y).
amistad(X,Y) :- amigo(Y,X).
amistad(X,Y) :- 
    amigo(X,Z), 
    amistad(Z,Y),
    X \= Y.

% Miembro en lista
miembro(X, [X|_]).
miembro(X, [_|T]) :-
    miembro(X, T).

% Rutina en lista
actividad_dia(Persona, Dia, Actividad) :-
    rutina(Persona, Actividad, Dia).
actividad_dia(Persona, Dia, Actividad) :-
    rutina(Persona, Actividad, entre_semana),
    miembro(Dia, [lunes, martes, miercoles, jueves, viernes]).
actividad_dia(Persona, Dia, Actividad) :-
    rutina(Persona, Actividad, fin_semana),
    miembro(Dia, [sabado, domingo]).

%invertir
invertir([], []).
invertir([H|T], R) :-
    invertir(T, RT),
    append(RT, [H], R).

%Nuevo personaje Jorge
trabaja(jorge).
juega(jorge).
cocina(jorge).

amigo(jorge, pedro).
prima(sofia, jorge).

rutina(jorge, trabajar, lunes).
rutina(jorge, trabajar, martes).
rutina(jorge, cocinar, miercoles).
rutina(jorge, jugar, viernes).
rutina(jorge, descansar, domingo).

% Lista de los días de la semana
dias([lunes, martes, miercoles, jueves, viernes, sabado, domingo]).

agenda_completa(_, [], []).
%Caso base
agenda_completa(Persona, [D|DiasResto], [(D,Act)|R]) :-
    rutina(Persona, Act, D),
    agenda_completa(Persona, DiasResto, R).
% Caso general
agenda_completa(Persona, [D|DiasResto], [(D,ninguna)|R]) :-
    \+ rutina(Persona, _, D),
    agenda_completa(Persona, DiasResto, R).


?- dias(Semana), agenda_completa(jorge, Semana, Agenda).
Agenda = [(lunes, trabajar),
          (martes, trabajar),
          (miercoles, cocinar),
          (jueves, ninguna),
          (viernes, jugar),
          (sabado, ninguna),
          (domingo, descansar)].

# Las rutinas por día se modelaron con hechos del tipo `rutina(Persona, Actividad, Dia)`, donde cada persona tiene asociada una acción y un día o categoría de días (ej. `entre_semana`, `fin_semana`). Para consultas más flexibles, se usaron reglas que relacionan estas categorías con listas de días específicos mediante recursión. De esta forma, es posible preguntar qué hace alguien en un día dado y obtener la actividad correspondiente.
