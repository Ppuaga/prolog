escala(Fig,K,KFig):-
    Fig=..[Tipo|Ds],multiplica(K,Ds,KDs),
    KFig=..[Tipo|KDs].

multiplica(_,[],[]).
multiplica(K,[D|Ds],[KD|KDs]):-
    KD is K*D,
    multiplica(K,Ds,KDs).



equilatero(P):-
    compound(P),
    p=..[_|L],
    igual(L).

igual([]).
igual([_]).
igual([X,X|L]):- igual([X|L]).

colorear([],_,[]).
colorear([X|Xs],C,[Y|Ys]):-
    X=..[N,A,B,_],
    Y=..[N,A,B,C],
    colorear(Xs,C,Ys).




barras([]).
barras([L|LL]):-
    estrellas(L),nl,
    barras(LL).

estrellas(N):-
    integer(N),
    N>0,
    write(*),
    N1 is N-1,
    estrellas(N1).

estrellas2(N):-
    integer(N),
    N<=0.