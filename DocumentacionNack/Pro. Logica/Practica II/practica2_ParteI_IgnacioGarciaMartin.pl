% practica2_ParteI_IgnacioGarciaMartin.PL
% "Grupo: Ignacio Garcia Martin, Aitor Moya Lopez, Sandra Ranilla Cortina, Rodrigo Rosado Gonzalez"
% "Matricula: U12M071, V13M022, V13M046, V13M018"
% "Practica 2: Prolog"


% " Metodo Enumerar " %
enumerar(Arcos,EnumNodos,EnumArcos):- length(Arcos,Y),
									  X is Y + 1,
			              listanumero(1,X,LN),
			              listanumero(1,Y,LA),
									  nodos(Arcos,L),
									  enumeraNodo(EnumNodos,L,LN),
									  enumeraArco(Arcos,EnumArcos,LA),
									  comprobarPareja(EnumNodos,EnumArcos).


% " Metodo auxiliar enumeraNodo " %
enumeraNodo([],[],_LN).
enumeraNodo([enum(N,X)|EnumNodos],[X|Xs],LN):-member(N,LN),
											  enumeraNodo(EnumNodos,Xs,LN),
											  noesmiembro(enum(N,_L),EnumNodos).


% " Metodo auxiliar enumeraArco " %
enumeraArco([],[],_LA).
enumeraArco([X|Arcos],[enum(N,X)|EnumArcos],LA):- member(N,LA),
												  enumeraArco(Arcos,EnumArcos,LA),
												  noesmiembro(enum(N,_L),EnumArcos).


% " Metodo auxiliar comprobarPareja " %
comprobarPareja(_EnumNodos, []).
comprobarPareja(EnumNodos, [enum(N,A1-A2)|EnumArcos]):-	member(enum(N1,A1),EnumNodos),
														member(enum(N2,A2),EnumNodos),
														comprobarParejaAux(N,N1,N2),
														comprobarPareja(EnumNodos,EnumArcos).

comprobarParejaAux(X,Y,Z):-
	A is Y - Z,
	A1 is abs(A),
	X == A1.


% " Metodo auxiliar noesmiembro " %
noesmiembro(X,[X|_]):- !, false.
noesmiembro(X,[_|L]):- !,noesmiembro(X,L).
noesmiembro(_,[]).


% " Metodo auxiliar listanumero " %
listanumero(X,X,[X]).
listanumero(X,Y,[X|L]):- X < Y,
					     X1 is X + 1,
					     listanumero(X1,Y,L).


% " Metodo auxiliar subterm " %
subterm(Term,Term).
subterm(Sub,Term) :-compound(Term),
					Term =.. [F|Args],
					subtermList(Sub, Args).

subtermList(Sub,[Arg|Args]):-subterm(Sub,Arg).
subtermList(Sub,[Arg|Args]):-subtermList(Sub,Args).


% " Metodo auxiliar nodos " %
nodos(X,Y):-setof(N,(subterm(N,X),atom(N)),Y).
