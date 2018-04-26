% practica1_ParteI_SandraRanillaCortina.PL
% "Grupo: Ignacio Garcia Martin, Aitor Moya Lopez, Sandra Ranilla Cortina, Rodrigo Rosado Gonzalez"
% "Matricula: U12M071, V13M022, V13M046, V13M018"
% "Practica 1: Automata Celular"


:- ensure_loaded(automaton).

% " Predicado Cells "
cells([],[]).
cells([X|L1],L2):-
	devuelve1([X|L1],o),
	devuelve2([X|L1],x),
	append1([o,x],L3,L2),
	cells1([X|L1],L3).

cells([X|L1],L2):-
	devuelve1([X|L1],o),
	devuelve2([X|L1],o),
	append1([o],L3,L2),
	cells1([X|L1],L3).
	
	
% " Predicado auxiliar Cells "
cells1([x,o],[x,o]).
cells1([o,o],[o]).
cells1([X|Xs],[W|Yt]):-
	append1([W],Ys,[Y|Yt]),
	cells1(Xs,Ys),
	regla(X,C,S,W),
	devuelve2([X|Xs],C),
	devuelve3([X|Xs],S).
	
	
% " Metodo auxiliar append "
append1([],L,L).
append1([X|Y],L,[X|L1]):-append1(Y,L,L1).


% " Metodo auxiliar devuelve 3 elementos contiguos de una lista "
devuelve1([X|Xs],X).
devuelve2([X|Xs],Y):-devuelve1(Xs,Y).
devuelve3([X|Xs],Z):-devuelve2(Xs,Z).