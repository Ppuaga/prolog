%
% Comprobar que un elemento no es miembro de una lista
%

noEsMiembro(_X,[]).
noEsMiembro(X,[Y|Ys]) :-
	X \= Y,
	noEsMiembro(X,Ys).


% Fin del fichero.





