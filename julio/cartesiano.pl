concat([],X,X).
concat([X|Xs],Y,[X|Z]):-
  concat(Xs,Y,Z).

cartesiano([],_,[]).
cartesiano([X|Xs],Y,Z):-
	cartesianoUno([X],Y,L1),
  concat(L1,L2,Z),
  cartesiano(Xs,Y,L2).

cartesianoUno([X],[Y],[(X,Y)]).
cartesianoUno([X],[Y|Ys],[(X,Y)|Zs]):-
  cartesianoUno([X],Ys,Zs).
