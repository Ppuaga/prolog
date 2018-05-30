%
% Borrar todas las ocurrencias de un elemento en una lista
%

borrarElemento1([X],X,[]).
borrarElemento1([X],Y,[X]):-
	X \= Y.
borrarElemento1([X|Xs],X,Ys) :- 
	borrarElemento1(Xs,X,Ys).
borrarElemento1([X|Xs],Z,[X|Ys]) :-
	X \= Z,
	borrarElemento1(Xs,Z,Ys).


borrarElemento2([],_X,[]).
borrarElemento2([X|Xs],X,Ys) :- 
	borrarElemento2(Xs,X,Ys).
borrarElemento2([X|Xs],Z,[X|Ys]) :-
	X \= Z,
	borrarElemento2(Xs,Z,Ys).


% Fin del fichero.





