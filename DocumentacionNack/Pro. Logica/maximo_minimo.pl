%
% Maximo y Minimo de dos numeros
%


% maximo(X,Y,Z) (no recursivo)

maximo(X,Y,X):-
	menor(Y,X).
maximo(X,Y,Y):-
	menor(X,Y).


% minimo(X,Y,Z) (recursivo)

minimo(0,Y,0).
minimo(s(X),0,0).
minimo(s(X),s(Y),s(Z)) :- minimo(X,Y,Z).



%%% Aritmetica Natural %%%%%

% Cero es un natural

nat(0).


% Para todo x: si x es un natural, s(x) también lo es

nat(s(X)):- nat(X).

% Definición del orden de los números naturales (<):

menor(0,X) :- nat(X).
menor(s(X),s(Y)) :- menor(X,Y).
	

% Definición de la suma de número naturales:

suma(0,X,X) :- nat(X).
suma(s(X),Y, s(Z)) :- suma(X,Y,Z).


% Definicion del producto de numeros naturales:
%
% X * 0 = 0 (para todo número X).
%

producto(X,0,0):- nat(X).

%
% X * Y' = (X * Y) + X
%
% (x)(y)(z)(t)(producto(x,y,t) & suma(t,x,z) -> producto(x,s(y),z))
%

producto(X,s(Y),Z):- producto(X,Y,T), suma(T,X,Z).



% Modulo: mod(X,Y,Z): Z es el resto de dividir X entre Y

mod(X, Y, X) :- menor(X, Y).
mod(X, Y, Z) :- 
	suma(X1, Y, X), mod(X1, Y, Z).



% Fin del fichero.





