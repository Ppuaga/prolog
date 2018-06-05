
%Autores
alumno_prode(Puado, Garcia, Pablo, v13m047).
alumno_prode(Fontan, Llamas, Sergio, u12m073).
alumno_prode(Omaza, Saldana, Kiyoshi, v13m080).

%cierre/2
cierre(Eslabones,Cadena):-
  sonCorrectos(Eslabones),
  cerrable(Eslabones),
  comb(Eslabones,Cadena),
  compruebaLista(Cadena).

%cierreMinimo/2


%cierreUnico/2


%eslabon/2
eslabon(Inicio,Fin).

%esCorrecto/1
esCorrecto(eslabon(Inicio,Fin)):-
  Inicio\==Fin.

%sonCorrectos/1
sonCorrectos([]).
sonCorrectos([X|Xs]):-
  esCorrecto(X),
  sonCorrectos(Xs).

%cerrable
cerrable(L):-
  length(L,N),
  N>=3.

% %borrar/3
% borrar(X,[X|T],T).
% borrar(X,[H|T],[H|NT]):-borrar(X,T,NT).
%
% %permutaciones/2
% permutacion([],[]).
% permutacion(Lista,[H|Perm]):-
%   borrar(H,Lista,Rest),
%   permutacion(Rest,Perm).
%
% %combinaciones/2
% combinaciones(3,_,[]).
% combinaciones(N,[X|T],[X|Comb]):-
%   length([X|T],N),
%   N > 2,
%   N1 is N - 1,
%   combinaciones(N1,T,Comb).
% combinaciones(N,[_|T],Comb):-
%   length([X|T],N),
%   N > 2,
%   combinaciones(N,T,Comb).

comb(InList,Out) :-
    splitSet(InList,_,SubList),
    SubList = [_|_],     /* disallow empty list */
    permute(SubList,Out).

splitSet([ ],[ ],[ ]).
splitSet([H|T],[H|L],R) :-
    splitSet(T,L,R).
splitSet([H|T],L,[H|R]) :-
    splitSet(T,L,R).

permute([ ],[ ]) :- !.
permute(L,[X|R]) :-
    omit(X,L,M),
    permute(M,R).

omit(H,[H|T],T).
omit(X,[H|L],[H|R]) :-
    omit(X,L,R).

% %posibles/2
% posibles(L,Res):-
%   comb(L,Comb),
%   permute(Comb,Res).

%pareja/3
pareja(eslabon(X,_),eslabon(X,_),X).
pareja(eslabon(X,_),eslabon(_,X),X).
pareja(eslabon(_,X),eslabon(X,_),X).
pareja(eslabon(_,X),eslabon(_,X),X).

% getFirst(eslabon(A,B),A).
% getLast(eslabon(A,B),B).
%
% pareja(eslabon(X,_),eslabon(X,_),X).
% pareja(getFirst(X,Letra),getLast(Y,Letra),Letra).
% pareja(getLast(X,Letra),getLast(Y,Letra),Letra).
% pareja(getLast(X,Letra),getFirst(Y,Letra),Letra).

% %add
% add(X,[],[X]).
% add(X,[Y|Tail],[Y|Tail1]):-
%   add(X,Tail,Tail1).

%concatenar/3
concatenar([],L,L).
concatenar([X|Y],Z,[X|U]):-concatenar(Y,Z,U).

%encadena/2
encadena([],[]).
encadena([X],[]).
encadena([X,Y|Xs],ListaLetras):-
  pareja(X,Y,Letra),
  concatenar([Letra],ListaLetras,ListaFinal),
  % add(Letra,ListaLetras,ListaCompleta),
  encadena([Y|Xs],ListaFinal).


%extremos/2
extremos([X|Xs],Letra):-
  last(Xs,Ultimo),
  pareja(Ultimo,X,Letra).

%noJuntas/1
noJuntas([]).
noJuntas([X,Y|Xs]):-
  X\==Y,
  noJuntas([Y|Xs]).

%compruebaLista/1
compruebaLista(L):-
  encadena(L,ListaLetras),
  extremos(L,Letra),
  concat(ListaLetras,[Letra],ListaSalida),
  concat([Letra],ListaSalida,ListaFinal),
  noJuntas(ListaFinal).
