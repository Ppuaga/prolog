% SPRINGFIELD.PL
% Declaración del módulo y de sus dependencias.

:- module(_,_,[bf]).
:- use_package(pure).

% "Si tanto Homer como Lenny trabajan, el reactor es estable"

estable(reactor) <- trabaja(homer), trabaja(lenny).


% "Homer trabaja siempre que hay donuts o cuando le vigila Smithers"

trabaja(homer) <- hay_donuts.
trabaja(homer) <- vigila(smithers,homer).


% "Lenny trabaja si trabaja Carl"

trabaja(lenny) <- trabaja(carl).


% "Carl trabaja cuando le vigila Smithers"

trabaja(carl) <- vigila(smithers,carl).

% "Hay donuts los lunes y los jueves"

hay_donuts <- hoy(lunes).
hay_donuts <- hoy(jueves).


% "Smithers vigila a Homer y a Lenny los lunes y viernes;
% a Carl los martes y jueves"

vigila(smithers,homer) <-
     hoy(lunes).
vigila(smithers,homer) <-
     hoy(viernes).

vigila(smithers,lenny) <-
     hoy(lunes).
vigila(smithers,lenny) <-
     hoy(viernes).

vigila(smithers,carl) <-
     hoy(martes).
vigila(smithers,carl) <-
     hoy(jueves).

% "Hoy es jueves"

hoy(jueves) <- .

% Fin del fichero.


















