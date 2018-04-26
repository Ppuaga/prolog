%
% Hechos iniciales:
%

progenitor(Homero,Merlina).
progenitor(Homero,PericlesJr).
progenitor(Pericles,Merlina).
progenitor(Pericles,PericlesJr).
progenitor(AbuAdams,Homero).
progenitor(AbuAdams,TLucas).
progenitor(AbuAdams,TCosa).

:- module(_,_,[bf]).
:- use_package(pure).


man(Homero,TLucas,TCosa,Pericles).
woman(AbuAdams,Morticia).

conyuge(Morticia,Homero).
conyuge(Homero,Morticia).


%
% Definición mediante reglas:
%


padre(X,Y):-
	progenitor(X,Y),man(X).

madre(X,Y):-
	progenitor(X,Y),woman(X).

hijo(X,Y):-
	progenitor(Y,X),man(X).

hija(X,Y):-
	progenitor(Y,X),woman(X).

bro(Y,Z):-
	progenitor(X,Y),progenitor(X,Z).

hermano(Y,Z):-
	progenitor(X,Y),progenitor(X,Z),man(X).

hermano(Y,Z):-
	progenitor(X,Y),progenitor(X,Z),woman(X).

tio(Z,Y):-
	progenitor(X,Y),hermano(Z,X).

tia(Z,Y):-
	progenitor(X,Y),hermana(Z,X).

abuelo(X,Z):-
	progenitor(X,Y),progenitor(Y,Z),man(X).

abuela(X,Z):-
	progenitor(X,Y),progenitor(Y,Z),woman(X).

sobrino(X,Y):-
	hijo(X,Z),bro(Y,Z).

sobrina(X,Y):-
	hija(X,Z),bro(Y,Z).

cunado(X,Y):-
	conyuge(X,Z),hermano(Y,Z).

cunada(X,Y):-
	conyuge(X,Z),hermana(Y,Z).

suegro(X,Y):-
	conyuge(X,Z),padre(Y,Z).

suegra(X,Y):-
	conyuge(X,Z),madre(Y,Z).

consuegro(Y,X):-
	progenitor(X,Z),suegro(Y,Z).

consuegra(Y,X):-
	progenitor(X,Z),suegra(Y,Z).


%
% Posibles consultas:
% ?- padre(X,Y).
% ?- madre(X,Y).
% ?- hijo(X,Y).
% ?- hija(X,Y).
% ?- hermano(X,Y).
% ?- hermana(X,Y).

% Fin del fichero.

