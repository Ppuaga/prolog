% Analisis sintactico: generar-testear

frase(L):-
	append(SN,SV,L),
	sn(SN),
	sv(SV).

sn(SN):-	
	append(SNA,SNB,SN),
	posesivo(SNA),
	nombre(SNB).

sn(SN):-
	append(SNA,SNB,SN),
	determinante(SNA),
	nombre(SNB).

sv(SV):-
 	append(SVA,SVB,SV),
	verbo(SVA),
	atributo(SVB).

atributo(SA):-
	append(SN,CN,SA),
	sn(SN),
	cn(CN).

cn(SV):- 	
	append(P,SN,SV),
	prep(P),
	sn(SN).

posesivo([mi]).
posesivo([mis]).
posesivo([tu]).
posesivo([tus]).

nombre([hermano]).
nombre([abuelo]).
nombre([primo]).
nombre([padres]).
nombre([tios]).
nombre([hijo]).
nombre([padre]).

verbo([es]).

determinante([el]).

prep([de]).


%% Pruebas:

% ?- frase([mi,primo,es,el,hijo,de,mis,tios]).
%%% yes

% ?- frase([tu,abuelo,es,el,padre,de,tus,padres]).
%%% yes 

% ?- frase([mi,primo,es,el,hijo]).
%%% no


% Fin del fichero.
















