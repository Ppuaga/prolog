%:- module(aritmetica_plus,[suma/3,entre/3]).

% Predicado 'plus': solo funciona en modo in-in-out

plus(X,Y,Z):- Z is X+Y.

% Predicado 'plus2': funciona en todos los modos menos en modo out-out-in

plus2(X,Y,Z):- number(X),number(Y), Z is X + Y.
plus2(X,Y,Z):- number(X),number(Z), Y is Z - X.
plus2(X,Y,Z):- number(Y),number(Z), X is Z - Y.


plus3(X,Y,Z):- number(X),number(Y), !, Z is X + Y.
plus3(X,Y,Z):- number(X),number(Z), !, Y is Z - X.
plus3(X,Y,Z):- number(Y),number(Z), !, X is Z - Y.



%
% Predicado 'suma' entre enteros empleando is/2 y previendo
% que los sumandos puedan no estar instanciados pero sí el resultado.
%

suma(X,Y,Z):-
	integer(X),
	integer(Y),
	Z is X + Y.

suma(X,Y,Z):-
	integer(X),
	integer(Z),
	Y is Z - X.

suma(X,Y,Z):-
	integer(Y),
	integer(Z),
	X is Z - Y.

suma(X,Y,Z):-       %out-out-in
	integer(Z),
	Z >= 0,
	entre(0,Z,X),
	Y is Z - X.

suma(X,Y,Z):-       %out-out-in
	integer(Z),
	Z < 0,
	entre(Z,0,X),
	Y is Z - X.

% Objetivos a probar:
% suma(3,2,5).
% suma(2,3,X).
% suma(X,Y,4).
% suma(-1,3,X).
% suma(2,-1,X).
% suma(X,3,Y).
% suma(-5,-4,X).
% suma(3,X,2).


%
% (x)(y)(z)( integer(x) & integer(y) & z >= x & z =< y -> entre(x,y,z) )
%
% entre(X,Y,Z): dados dos enteros X e Y, Z es un entero entre ambos
%

entre(LimInf,LimSup,N):-
	integer(LimInf),
	integer(LimSup),
	entre_aux(LimInf,LimSup,N).


entre_aux(X,Y,X):-
	Y >= X.

entre_aux(X,Y,Z):-
	Y > X,
	X1 is X + 1,
        entre_aux(X1,Y,Z).

% Fin del fichero.















