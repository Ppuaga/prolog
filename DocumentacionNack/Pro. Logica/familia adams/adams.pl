%
% Hechos iniciales:
%

progenitor_de(Homero,Merlina).
progenitor_de(Homero,PericlesJr).
progenitor_de(Pericles,Merlina).
progenitor_de(Pericles,PericlesJr).
progenitor_de(AbuAdams,Homero).
progenitor_de(AbuAdams,TLucas).
progenitor_de(AbuAdams,TCosa).


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




%
% Posibles consultas:
% ?- padre(A,Pericles).
% ?- madre(A,TCosa).
% ?- hermano(A,Homero).
%

% Fin del fichero.

