% Analisis sintactico: DCGs

:- use_package(dcg).

frase --> sn, sv.

sn --> posesivo, nombre.
sn --> determinante, nombre.

sv --> verbo, atributo.
atributo --> sn, cn.
cn --> prep, sn.

posesivo --> [mi].
posesivo --> [mis].
posesivo --> [tu].
posesivo --> [tus].

nombre --> [hermano].
nombre --> [abuelo].
nombre --> [primo].
nombre --> [padres].
nombre --> [tios].
nombre --> [hijo].
nombre --> [padre].

verbo --> [es].
determinante --> [el].
prep --> [de].



%% Pruebas:
% frase([mi,abuelo,es,el,padre,de,mi,padre],R).
%% R=[]

% frase([tu,hermano,es,el,hijo,de,tus,padres],R).
%% R=[]

% frase([mi,primo,es,el,hijo,de,mis,tios,y,de,tus,tios],R).
%% no

% frase([mi,primo,es,el,hijo,de,mi,tios],R).
%% R=[]


% Fin del fichero.




















