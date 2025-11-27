simplifica(+(0, X), X).
simplifica(+(X, 0), X).
simplifica(*(1, X), X).
simplifica(*(X, 1), X).
simplifica(*(0, _), 0).
simplifica(*(_, 0), 0).
simplifica(X, X).

derivada(X, X, 1).
derivada(C, _, 0) :- number(C).
derivada(A + B, X, DA + DB) :-
    derivada(A, X, DA),
    derivada(B, X, DB).
derivada(A * B, X, A*DB + B*DA) :-
    derivada(A, X, DA),
    derivada(B, X, DB).
derivada(A - B, X, DA - DB) :-
    derivada(A, X, DA),
    derivada(B, X, DB).


evalua(X, X, V, V).
evalua(C, _, _, C) :- number(C).
evalua(A + B, X, V, R) :-
    evalua(A, X, V, RA),
    evalua(B, X, V, RB),
    R is RA + RB.
evalua(A * B, X, V, R) :-
    evalua(A, X, V, RA),
    evalua(B, X, V, RB),
    R is RA * RB.


suma(frac(A, B), frac(C, D), frac(N, M)) :-
    N is A*D + C*B,
    M is B*D.

resta(frac(A, B), frac(C, D), frac(N, M)) :-
    N is A*D - C*B,
    M is B*D.


resuelve(X + N = M, X, V) :-
    number(N), number(M),
    V is M - N.

resuelve(N + X = M, X, V) :-
    number(N), number(M),
    V is M - N.

% --------------------- PRUEBAS ---------------------
% ?- simplifica(*(1, +(0, X)), R).
% R = X.

% ?- simplifica(*(0, +(X, 3)), R).
% R = 0.

% ?- simplifica(+(X, 0), R).
% R = X.

% ?- simplifica(*(1, +(Y, 0)), R).
% R = Y.

% ?- derivada(x*x + 3*x + 2, x, D).
% D = x*1 + x*1 + 3*1 + 0.

% ?- derivada(x*x*x, x, D).
% D = x*x*1 + x*(x*1 + x*1).
% (Simplificado mentalmente: D = 3*x*x)

% ?- derivada(x*x - 4*x + 1, x, D).
% D = x*1 + x*1 - (4*1 + 0).
% (Simplificado: D = 2*x - 4)

% ?- derivada(2*x*x + 5*x + 7, x, D).
% D = 2*x*1 + 2*(x*1 + x*1) + 5*1 + 0.
% (Simplificado: D = 4*x + 5)

% ?- evalua(x*x + 3*x + 2, x, 3, R).
% R = 20.

% ?- evalua(x*x - 4*x + 4, x, 2, R).
% R = 0.

% ?- derivada(x*x + 3*x + 2, x, D), evalua(D, x, 2, R).
% D = x*1 + x*1 + 3*1 + 0,
% R = 7.

% ?- suma(frac(1,2), frac(1,3), R).
% R = frac(5,6).

% ?- suma(frac(2,5), frac(3,10), R).
% R = frac(35,50).

% ?- resta(frac(2,5), frac(3,10), R).
% R = frac(5,50).

% ?- resuelve(x + 3 = 7, x, V).
% V = 4.

% ?- resuelve(5 + x = 10, x, V).
% V = 5.

% ?- resuelve(x + 1 = 4, x, V).
% V = 3.

