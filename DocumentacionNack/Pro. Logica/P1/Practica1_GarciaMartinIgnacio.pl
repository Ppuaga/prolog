:- module(_,_,[bf]).

concatenar([],L,L).
concatenar([X|Y],Z,[X|U]):- concatenar(Y,Z,U).

ultimo(X,[X]).
ultimo(X,[_|R]):- ultimo(X,R).

inversa([],[]).
inversa([X|R],L):-inversa(R,L1),
    concatenar(L1,[X],L).

duplica([],[]).
duplica([X|Xs],[X,X|L]):-duplica(Xs,L).

duplica2([],[]).
duplica2([X|Xs],[X|Xs]):-duplica2(Xs,Xs).

extrae([],[],_).
extrae([X|Xs],[Y|Ys],[[X,Y]|L]):-extrae(Xs,Ys,L).

rellenar(_,[],[]).
rellenar([X|Xs],[_|Ys],[X|Ls]):-
    concatenar(Xs,[X],L1),
    rellenar(L1,Ys,Ls).

reres(_,[],_).
reres(X,Y,L):-
    concatenar(X,L,L1),
    rellenar(X,Y,L1).

vib2(_,_,[],[]).
vib2([P|Ps],C,[_|Fs],[Z|T]):-   
    vib([P|Ps],C,Z),    
    concatenar(Ps,[P],H1),
    vib2(H1,C,Fs,T).

vib(_,[],[]).
vib([P|Ps],[_|Cs],[P|Z]):-
    concatenar(Ps,[P],H),
    vib(H,Cs,Z).


rellenarColumnas(_,[],[]).
rellenarColumnas([P|Ps],[_|Cs],[P|Z]):-
    concatenar(Ps,[P],H),
    rellenarColumnas(H,Cs,Z).

rotar([X|Xs],L):-concatenar(Xs,[X],L).

rotaciones(_,[],[]).
rotaciones(P,[_|Cs],[L|L1]):-
    rotar(P,L),
    rotaciones(L,Cs,L1).

invertir([],[]).
invertir([A],[A]).
invertir([F,F1|Fs],[F,F2|T]):-
    inversa(F1,F2),
    invertir(Fs,T).
    
rellenarFilas(_,_,[],[]).
rellenarFilas([P|Ps],C,[_|Fs],[Z|T]):-   
    rellenarColumnas([P|Ps],C,Z),    
    rotaciones([P|Ps],C,X),
    ultimo(Y,X),
    rellenarFilas(Y,C,Fs,T).

vibora(P,C,F,R):-
    rellenarFilas(P,C,F,Rc),
    invertir(Rc,R).

