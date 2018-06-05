alumno_prode('Omaza','Saldana','Kiyoshi','v13m080').
alumno_prode('Puado','Garcia','Pablo','v13m049').
alumno_prode('Fontan','Llamas','Sergio','u12m073').

% LISTAS
% 1. Elimina el elemento indicado de la lista.
remove(E, [E|T], T).
remove(E, [H|T], [H|TE]):-
  remove(E, T, TE).

% 2. Verifica si un elemento pertenece a una lista.
belong(E, [E|_]).
belong(E, [_|T]):-
  belong(E, T).

% 3. Genera una lista de 3 a N.
do_list(N, L):- do_list1(N, [], L).
do_list1(2, L, L):-
  !.
do_list1(N, R, L):-
  N > 0, N1 is N-1, do_list1(N1, [N|R], L).

% 4. Penultimo elemento de una lista.
second_last([X,_], X).
second_last([_|Xs], X):-
  second_last(Xs, X).

% CIERRES
% 1. Todos los cierres posibles.
cierre(Le, X):-
  length(Le, T), T >= 3,
  not(vertex_same(Le)),
  not(eslabones_same(Le)),
  comb_N(T, Le, X),
  eslabones_all(X).
									   
% 2. Cierre mínimo.
cierreMinimo(L, N):-
  cierre(L, S), !, size(S, N).

% 3. Todos los cierres están compuestos por diferentes eslabones.
cierreUnico(LE, Xs):-
  length(LE, T), T >= 3,
  not(vertex_same(LE)),
  not(eslabones_same(LE)),
  comb_one(T, LE, X),
  join_eslabon(X, Xs).


% ESLABONES
% 1. Devuelve todas las combinaciones posibles de longitud N.
comb(0, _Xs, []).
comb(N, [X|Xs], [X|Cs]):-
  N > 0,
  N1 is N-1,
  comb(N1, Xs, Cs).
comb(N, [_X|Xs], Cs):-
  N > 0,
  comb(N, Xs, Cs).

% 2. Devuelve todas las permutaciones posibles 
perm([], []).
perm([X|Xs], PXs):-
  perm(Xs, Ps),
  remove(X, PXs, Ps).

% 3. Las combinaciones permutadas de longitud N.
comb_N(N, L, X):-
  do_list(N, Ln),
  belong(A, Ln),
  apply_CyP(A, L, X).

% 4. Obtenemos una combinacion de cada longitud (3 a N)
comb_one(N, L, X):-
  do_list(N, Ln),
  belong(A, Ln),
  comb(A, L, X).

% 5. Devuelve todas las combinaciones permutadas
apply_CyP(N, L, X):-
  comb(N, L, Xs),
  perm(Xs, X).

% 6. Comprueba si estan enlazados
is_linked(eslabon(X,_), eslabon(X,_), X).
is_linked(eslabon(X,_), eslabon(_,X), X).
is_linked(eslabon(_,X), eslabon(_,X), X).
is_linked(eslabon(_,X), eslabon(X,_), X).

% 7. Comprueba si 3 eslabones son adyacentes.
is_band(A, B, C):-
  is_linked(A, B, X),
  is_linked(B, C, Y),
  X\=Y.

% 8. Comprueba si los extremos del eslabon son iguales.
vertex_same([eslabon(X, Y)]):- 
  X==Y.
vertex_same([eslabon(X, Y)|_]):- 
  X==Y.
vertex_same([eslabon(_,_)|Xs]):- 
  vertex_same(Xs).

% 9. Comprueba si los eslabones son iguales.
eslabones_same([eslabon(A, B), Y|Xs]):-
  remove(eslabon(A, B), [eslabon(A, B), Y|Xs], [Y|Xs]),
  belong(eslabon(A, B), [Y|Xs]).
eslabones_same([eslabon(A, B), Y|Xs]):-
  remove(eslabon(A,B), [eslabon(A, B), Y|Xs], [Y|Xs]),
  belong(eslabon(B, A), [Y|Xs]).
eslabones_same([_|Xs]):-
  eslabones_same(Xs).


% TRATAMIENTO DE CADENAS
% 1. Devuelve todos los cadenas posibles.
eslabones_all([A, B, C]):-
  is_band(A, B, C),
  is_band(B, C, A),
  is_band(C, A, B).
eslabones_all([A, B, C|Cs]):-
  Cs\=[],
  last([A, B, C|Cs], U),
  second_last([A, B, C|Cs], P),
  is_band(P, U, A),
  is_band(U, A, B),
  right_band([A, B, C|Cs]).						   

% 2. Recorre las cadenas.
right_band([A, P, U]):-
  is_band(A, P, U).
right_band([A, B, C|Cs]):-
  Cs\=[],
  is_band(A, B, C),
  right_band([B, C|Cs]).

% 3. Une cadenas. 
join_eslabon(L, X):-
  perm(L, X),
  eslabones_all(X),
  !.

% OTROS PREDICADOS
% Negación.
not(Goal) :-
    call(Goal),
    !,
    fail.
not(_).
