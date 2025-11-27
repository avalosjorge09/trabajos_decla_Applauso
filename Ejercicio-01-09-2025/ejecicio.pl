estudiante(kelvin).
estudiante(raul).
estudiante(florence).
estudiante(mauricio).
estudiante(melissa).

martir(ellacuria).

no_es_estudiante(Nombre) :- \+ estudiante(Nombre).

primer_estudiante(X) :- estudiante(X), !.

verificar_estudiante :- 
    write("Ingreasa nombre: "), 
    read(Nombre),
    (estudiante(Nombre)
    -> write("Es estudiante:") ; 
    write("No es estudiante")).

mostrar_estudiante :-
    estudiante(Nombre) ,
    write("Estudiante: ") ,
    write(Nombre), nl ,
    fail.