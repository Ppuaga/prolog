%% Cada casa es una lista [Numero,Color,Pais,Bebida,Mascota,Cigarrillos].

%% El vecindario es una lista de casas que cumplen las condiciones del acertijo


vecino(V,Casa1,Casa2):- vecinoIzq(V,Casa1,Casa2).
vecino(V,Casa1,Casa2):- vecinoIzq(V,Casa2,Casa1).

vecinoIzq([C1|[C2|_]],C1,C2).
vecinoIzq([_|Y],C1,C2):- vecinoIzq(Y,C1,C2).


miembro(X, [X|Y]). 
miembro(X, [Y|Z]):- miembro(X,Z). 

vecindario(V) :-
	V = [[1,_,noruego,_,_,_],
	     [2,azul,_,_,_,_],
 	     [3,_,_,leche,_,_],
	     [4,_,_,_,_,_],
             [5,_,_,_,_,_]], 
         miembro([_,roja,ingles,_,_,_],V),
	 miembro([_,_,sueco,_,perro,_],V),
	 miembro([_,_,danes,te,_,_],V),
	 vecinoIzq(V,[_,verde,_,_,_,_],[_,blanca,_,_,_,_]),
	 miembro([_,verde,_,cafe,_,_],V),
	 miembro([_,_,_,_,pajaro,pallmall],V),
	 miembro([_,amarilla,_,_,_,dunhill],V),
	 vecino(V,[_,_,_,_,_,blend],[_,_,_,_,gato,_]),
	 vecino(V,[_,_,_,_,caballo,_],[_,_,_,_,_,dunhill]),
	 miembro([_,_,_,cerveza,_,bluemaster],V),
	 miembro([_,_,aleman,_,_,prince],V),
	 vecino(V,[_,_,_,_,_,blend],[_,_,_,agua,_,_]),
	 miembro([_,_,_,_,pez,_],V).

mascota(Mascota,Persona):- 
	vecindario(V),
	miembro([_,_,Persona,_,Mascota,_],V).

 


