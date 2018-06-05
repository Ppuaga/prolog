% practica2_ParteII_IgnacioGarciaMartin.PL
% "Grupo: Ignacio Garcia Martin, Aitor Moya Lopez, Sandra Ranilla Cortina, Rodrigo Rosado Gonzalez"
% "Matricula: U12M071, V13M022, V13M046, V13M018"
% "Practica 2: Prolog"


% " Metodo reparacion " %
reparacion(Equipo, Tiempo, Pareja):-length(Equipo,NumeroMiembros),
									length(Pareja,Combinaciones),
									Comb is NumeroMiembros - 1,
									combinatoria(Comb,Combinaciones),
									reparacionAux(Equipo,Tiempo,Pareja,Equipo).


% " Metodo auxiliar reparacionAux " %
reparacionAux(Equipo,Tiempo, [],TiempoBuzo):- Tiempo >= 0.
% reparacionAux(Equipo,Tiempo,[pareja(X,Y,TiempoF)|Pareja], TiempoBuzo):- subterm(buzo(X,TiempoX),Equipo),
																		subterm(buzo(Y,TiempoY),Equipo),
																		tiempo(TiempoX,TiempoY,TiempoF),
																		Tiempo >= TiempoF,
																		distinto(X,Y),
																		Tiempo1 is Tiempo - TiempoF,
																		actualizarTiempo(pareja(X,Y,TiempoF),TiempoBuzo,Equipo1),
																		inmersion(Equipo1,TiempoBuzo,EquipoInm),
																		reparacionAux(EquipoInm,Tiempo1,Pareja,TiempoBuzo),
																		noesmiembro(pareja(Y,X,T), Pareja),
																		noesmiembro(pareja(X,Y,T), Pareja).


% " Metodo auxiliar actualizarTiempo " %
actualizarTiempo(_X,[],[]).
actualizarTiempo(pareja(X,Y,T),[buzo(A,TiempoA)|Equipo],[buzo(A,TiempoB)|Equipo1]):- A == X,
																					 TiempoB is TiempoA - T,
																					 actualizarTiempo(pareja(X,Y,T),Equipo, Equipo1).

actualizarTiempo(pareja(X,Y,T),[buzo(A,TiempoA)|Equipo],[buzo(A,TiempoB)|Equipo1]):- A == Y,
																					 TiempoB is TiempoA - T,
																					 actualizarTiempo(pareja(X,Y,T),Equipo, Equipo1).

actualizarTiempo(pareja(X,Y,T),[buzo(A,TiempoA)|Equipo],[buzo(A,TiempoA)|Equipo1]):- distinto(A,X),
																					 distinto(A,Y),
																					 actualizarTiempo(pareja(X,Y,T),Equipo, Equipo1).


% " Metodo auxiliar inmersion " %
inmersion([],[],[]).
inmersion([buzo(_X,TiempoX)|Equipo1],[buzo(X,TiempoY)|TiempoBuzo],[buzo(X,TiempoY)|EquipoInm]):- TiempoX == 0,
																								 inmersion(Equipo1,TiempoBuzo,EquipoInm).

inmersion([buzo(X,TiempoX)|Equipo1],[buzo(_X,TiempoY)|TiempoBuzo],[buzo(X,TiempoX)|EquipoInm]):- TiempoX > 0,
																								inmersion(Equipo1,TiempoBuzo,EquipoInm).


% " Metodo auxiliar tiempo " %
tiempo(TiempoX,TiempoY,TiempoX):- TiempoY >= TiempoX.
tiempo(TiempoX,TiempoY,TiempoY).


% " Metodo auxiliar distinto " %
distinto(X,Y):- X \= Y.


% " Metodo auxiliar noesmiembro " %
noesmiembro(X,[X|_]):- !, false.
noesmiembro(X,[_|L]):- !,noesmiembro(X,L).
noesmiembro(_,[]).


% " Metodo auxiliar combinatoria " %
combinatoria(0,0).
combinatoria(1,1).
combinatoria(X,Y):- X > 1,
					X1 is X - 1,
					combinatoria(X1,Y1),
					Y is Y1 + X.


% " Metodo auxiliar subterm " %
subterm(Term,Term).
subterm(Sub,Term) :-compound(Term),
					Term =.. [F|Args],
					subtermList(Sub, Args).

subtermList(Sub,[Arg|Args]):-subterm(Sub,Arg).
subtermList(Sub,[Arg|Args]):-subtermList(Sub,Args).
