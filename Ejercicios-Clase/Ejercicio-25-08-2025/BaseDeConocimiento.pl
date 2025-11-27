%Rivoria
esposo(esteban,mariela).
hijo(clara,esteban).
hijo(rodolfo,esteban).
hijo(ismael,esteban).
hijo(clara,mariela).
hijo(rodolfo,mariela).
hijo(ismael,mariela).
esposo(andres,clara).
hijo(sofia,andres).
hijo(sofia,clara).
esposo(rodolfo,teresa).
hijo(lucas,rodolfo).
hijo(lucas,teresa).
hijo(martina,rodolfo).
hijo(martina,teresa).
amigo(hector,ismael).

descendiente(X,Y) :- hijo(X,Y).
descendiente(X,Y) :- hijo(X,Z), descendiente(Z,Y).

familia(X,deRivoria) :- hijo(X, esteban) ; hijo(X, mariela); descendiente(X,esteban) ; descendiente(X, mariela) ; amigo(hector,_).

%Montelar
esposo(alonso,beatriz).
hijo(felipe, alonso).
hijo(felipe, beatriz).
hijo(catalina,alonso).
hijo(catalina,beatriz).
hijo(emilio,alonso).
hijo(emilio, beatriz).
esposo(andres,catalina).

familia(X,deMontelar) :- hijo(X, alonso) ; hijo(X, beatriz); descendiente(X,alonso) ; descendiente(X, beatriz).

%Oficios
trabaja(hector,herrero).
trabaja(teresa,tejedora).
trabaja(clara,maestra).


trabaja(catalina,curandera).
trabaja(felipe,explorador).
trabaja(emilia,ceramista).


herencia(X,Y) :- descendiente(X,Z), trabaja(Z,Y) X\=lucas.

herencia(lucas, herrero).

%Durania
esposo(mateo,irene).
trabaja(mateo,agricultor).
trabaja(irene,criadora).

familia(X,deDurania) :- esposo(X,irene) ; esposo(mateo,X).

alianza(deRivoria,deDurania).

rival(rodolfo,felipe).
rival(clara,catalina).

celebra(X,fiestaRio) :- familia(X,deRivoria).
celebra(X,fiestaLuna) :- familia(X,deMontelar).
celebra(X, fiestaGrano) :- familia(X,deDurania).

cree(X,agua) :- celebra(X,fiestaRio).
cree(X,montana) :- celebra(X,fiestaLuna).
cree(X,tierra) :- celebra(X,fiestaGrano).

