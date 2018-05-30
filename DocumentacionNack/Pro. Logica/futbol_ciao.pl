% futbol_ciao.pl
%
% Representación del conocimiento (sin necesidad de variables).
% En Prolog, todas las constantes deben comenzar por minúscula.
%

:- module(_,_,[bf]).
:- use_package(pure).

% Si CR7 marca y Casillas para, entonces el R. Madrid gana.

gana(real-madrid)<- 
	marca(cr7),
	para(casillas).


% CR7 marca si es feliz o si el partido es en domingo.

marca(cr7)<- es_feliz(cr7).

marca(cr7)<- se_juega(domingo).


% CR7 es feliz cuando hay entrenamiento vespertino o cuando Marcelo es su amigo.

es_feliz(cr7)<- entrenamiento(vespertino).
es_feliz(cr7)<- amigo(marcelo,cr7).


% Casillas para cuando el partido es en sábado o cuando el partido es en domingo.

para(casillas)<- se_juega(sabado).
para(casillas)<- se_juega(domingo).


%	Marcelo es amigo de CR7 si Casillas para y el entrenamiento es matutino.

amigo(marcelo,cr7)<- 
  para(casillas),
  entrenamiento(matutino).


% Hay entrenamiento vespertino los martes y jueves; y entrenamiento matutino los lunes y miércoles.

entrenamiento(vespertino)<- hoy(martes).

entrenamiento(vespertino)<- hoy(jueves).

entrenamiento(matutino)<- hoy(lunes).

entrenamiento(matutino)<- hoy(miercoles).


%	Hoy es martes.

hoy(martes) <- .


% El partido es en sábado.

se_juega(sabado) <- .


%
% Posibles consultas:
% ?- amigo(marcelo,cr7).
% ?- para(casillas).
% ?- gana(real-madrid).
%

% Fin del fichero.













