rectangulo(Base, Altura) :-
    Area is Base * Altura,
    Perimetro is 2 * (Base + Altura),
    write("El area es "), write(Area),nl, write("El perimetro es "),  write(Perimetro).

par_impar(N) :- (mod(N,2)=:= 0 ->write("Es par"); write("Es impar")).



tabla(X) :-
    between(1,10,R),
    Res is X*R,
    write(X*R),
    fail.
tabla(_).

mayor :-
    write("Digite el primer numero: "),
    read(X),
    write("Digite el segundo numero: "),
    read(Y),
    (number(X), number(Y) ->  % Validar que son números
        (X > Y ->
            (write(X), write(" es mayor que "), write(Y));
            (write(Y), write(" es mayor que "), write(X))
        );
        write("Error: debes ingresar numeros validos.")
    ).




categoria_edad :-
    write("Digite la edad: "),
    read(Edad),
    (
        Edad < 15 ->
            write("Categoria: Nino")
    ;
        (Edad >= 15, Edad < 18) ->
            write("Categoria: Adolescente")
    ;
        write("Categoria: Adulto")
    ).

aprobacion :-
    write("Digite la nota: "),
    read(Nota),
    Nota > 6 -> write("Aprobado") ; write("Reprobado").


hijo(alex,diego).
hijo(ana,diego).
hijo(leo, pablo).

es_hermano(A, B) :-
    hijo(A, Padre1),
    hijo(B, Padre2),
    hijo(_, Padre1) = hijo(_, Padre2), 
    A \== B.

# ejercicios hechos fuerda de la hora clase para repaso
distancia(X1,X2,Y1,Y2,D) :-
    DX is X2 -X1,
    DY is Y2-Y1,
    D is sqrt(DX*DX + DY*DY).

conversor(Grados, Radianes) :-
    Radianes is Grados * pi /180.


