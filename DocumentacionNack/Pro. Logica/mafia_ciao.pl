% mafia.pl
%
% Representaci�n del conocimiento (sin necesidad de variables).
% En Prolog, todas las constantes deben comenzar por min�scula.
%

:- module(_,_,[bf]).
:- use_package(pure).


% Si Corleone controla Manhattan y Brooklyn, eliminar� a Solozzo.

elimina(corleone, solozzo) <-
	controla(corleone, manhattan),
	controla(corleone, brooklyn).

% Si Solozzo controla la droga y Roth le apoya, eliminar� a Corleone.

elimina(solozzo, corleone) <-
	controla(solozzo, droga),
	apoya(roth, solozzo).

% Si Roth apoya a Solozzo, �ste controlar� el Bronx y Harlem

controla(solozzo, bronx) <-
	apoya(roth, solozzo).

controla(solozzo, harlem) <-
	apoya(roth, solozzo).

% pero si apoya a Corleone, �ste controlar� Manhattan y Brooklyn.

controla(corleone, manhattan) <-
	apoya(roth, corleone).

controla(corleone, brooklyn) <-
	apoya(roth, corleone).

% Corleone controla el juego y Solozzo la droga.

controla(corleone, juego).

controla(solozzo, droga).

% Es necesario que Corleone controle a la polic�a si controla el juego.

controla(corleone, policia) <-
	controla(corleone, juego).

% Roth apoyar� a quien le garantice impunidad.

apoya(roth, solozzo) <-
	garantiza(solozzo, roth).

apoya(roth, corleone) <-
	garantiza(corleone, roth).

% El que Corleone controle a la polic�a implica que puede garantizar la
% impunidad de Roth.

garantiza(corleone, roth) <-
	controla(corleone, policia).

%
% Posibles consultas:
% ?- elimina(solozzo, corleone).
% ?- elimina(corleone, solozzo).
%

% Fin del fichero.













