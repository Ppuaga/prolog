:- module(_,_,[bf]).

elimina(solozzo):-control(corleone,manhattan),control(corleone,brooklyn).
elimina(corleone):-control(solozzo,droga),apoya(solozzo,roth).

control(solozzo,bronx):-apoya(solozzo,roth).
control(solozzo,harlem):-apoya(solozzo,roth).
control(corleone,manhattan):-apoya(corleone,roth).
control(corleone,brooklyn):-apoya(corleone,roth).
control(corleone,policia).
control(solozzo,droga).



apoya(X,roth):-impunidad(X,roth).

impunidad(corleone,roth):-control(corleone,policia).