% Analisis sintactico: Expresiones aritmeticas

:- use_package(dcg).

expr --> term.
expr --> term, [+], expr.
expr --> term, [-], expr.

term --> num.
term --> num, [*], term.
term --> num, [/], term.

num --> [D], { number(D) }.

parse(E) :- expr(E,[]).

%% Parámetros en no-terminales — construir estructuras.
%% num(D) --> [D], { number(D) }.


%% Pruebas:

% ?- parse([3,+,1]).

% ?- parse([3,-,a]).

% ?- parse([3,*,2,+,3]).

% Fin del fichero.
















