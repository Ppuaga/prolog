% Analisis sintactico: listas diferencia

frase(S):-
	sn(S-S1),
	sv(S1-[ ]).

sn(SN-R):-
	posesivo(SN-SN1),
	nombre(SN1-R).

sn(SN-R):-
	determinante(SN-SN1),
	nombre(SN1-R).

sv(SV-R):- 
	verbo(SV-SV1),
	atributo(SV1-R).

atributo(SA-R):-
	sn(SA-SA1),
	cn(SA1-R).

cn(SV-R):- 
	prep(SV-SV1),
	sn(SV1-R).


posesivo([mi|X]-X).
posesivo([mis|X]-X).
posesivo([tu|X]-X).
posesivo([tus|X]-X).

nombre([hermano|X]-X).
nombre([abuelo|X]-X).
nombre([primo|X]-X).
nombre([padres|X]-X).
nombre([tios|X]-X).
nombre([hijo|X]-X).
nombre([padre|X]-X).

verbo([es|X]-X).
determinante([el|X]-X).
prep([de|X]-X).



%% Pruebas:

% ?- frase([mi,primo,es,el,hijo,de,mis,tios]).
%%% yes

% ?- frase([mi,primo,es,el,hijo]).
%%% no

% ?- nombre([hijo,de,mis,tíos] - X).
%% X = [de, mis, tíos] 
%% Yes

% ?- sn([mi,abuelo,es,el,padre,de,mi,padre] - X).
%% X = [es, el, padre, de, mi, padre] 
%% Yes



% Fin del fichero.
















