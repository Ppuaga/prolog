% practica1_ParteII_SandraRanillaCortina.PL
% "Grupo: Ignacio Garcia Martin, Aitor Moya Lopez, Sandra Ranilla Cortina, Rodrigo Rosado Gonzalez"
% "Matricula: U12M071, V13M022, V13M046, V13M018"
% "Practica 1: Codificacion Huffman Plog"



% " Algoritmo Huffman Plog: Primera Fase " %

% " Funcion Arbol Balanceado " %
arbolBalanceadoPar(void).
arbolBalanceadoPar(tree(par(C,N),Left,Right)):- pre_order(Left,LL),
												pre_order(Right,LR),
												compara(LL,LR).
											

% " Suma de numeros naturales " %
nat(0).
nat(s(X)):-nat(X).

suma(0,X,X):-nat(X).
suma(s(X),Y,s(Z)):-suma(X,Y,Z).


% " Funcion modulo " %
menor(0,X):-nat(X).
menor(s(X),s(Y)):-menor(X,Y).


mod(X, Y, X) :-menor(X, Y).
mod(X, Y, Z) :-suma(X1, Y, X), 
			   mod(X1, Y, Z).



% " Funcion preorder " %
pre_order(void,[]).
pre_order(tree(X,Left,Right),Order):-pre_order(Left,OrderLeft),
									 pre_order(Right,OrderRight),
									 segundo(X,N),
									 concatenar([N|OrderLeft],OrderRight,Order).

concatenar([],L,L).												
concatenar([X|Xs],Y,[X|Zs]):-concatenar(Xs,Y,Zs).


% " Funcion compara dos listas " %
compara(void,L2):-false.
compara(L1,void):-false.
compara(L1,L2):-sumaLista(L1,S1),
				sumaLista(L2,S2),
				S1 = S2.
				
	
% " Funcion suma lista " %
compruebamod(N,0):- mod(N,s(s(0)),s(0)).
compruebamod(N,N):- mod(N,s(s(0)),0).

segundo(par(C,N),N).

sumaLista([],0).
sumaLista([X|L],S):- sumaLista(L,S1),
					 compruebamod(X,P),
					 suma(S1,P,S).
					 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% " Algoritmo Huffman Plog: Segunda Fase " %
				 
		
% " Funcion Arbol Amplificado " %
arbolAmplificado(void,void).
arbolAmplificado(tree(par(C,X1),Left1,Right1),tree(par(C,X2),Left2,Right2)):-suma(X1,0,X2),
																			 comparaAmpliacion(X1,tree(par(C,X1),Left1,Right1),tree(par(C,X2),Left2,Right2)),
																			 comparaLongitud(tree(par(C,X1),Left1,Right1),tree(par(C,X2),Left2,Right2)).

				
% " Funcion Compara Ampliacion " % 				
comparaAmpliacion(0,X,X).
comparaAmpliacion(N,tree(par(C,X1),void,void),tree(par(C,X2),void,void)):-suma(X1,N,X2).
comparaAmpliacion(N,tree(par(C,X1),Left1,void),tree(par(C,X2),Left2,void)):-suma(X1,0,X2),comparaAmpliacion(N,Left1,Left2).
comparaAmpliacion(N,tree(par(C,X1),void,Right1),tree(par(C,X2),void,Right2)):-suma(X1,0,X2),comparaAmpliacion(N,Right1,Right2).
comparaAmpliacion(N,tree(par(C,X1),Left1,Right1),tree(par(C,X2),Left2,Right2)):- suma(X1,0,X2),comparaAmpliacion(N,Left1,Left2),
																				 comparaAmpliacion(N,Right1,Right2).
																   

% " Funcion Compara Longitud " %
comparaLongitud(X,Y):-pre_order(X,LX),
					  pre_order(Y,LY),
					  longitudLista(LX,NX),
					  longitudLista(LY,NY),
					  NX = NY.

% " Funcion Longitud Lista " %
longitudLista([],0).
longitudLista([_X|Xs],Y):-longitudLista(Xs,T),
						  suma(s(0),T,Y).