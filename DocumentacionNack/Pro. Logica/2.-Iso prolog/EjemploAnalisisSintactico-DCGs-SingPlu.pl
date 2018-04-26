% Analisis sintactico: DCGs solucionando sing/plu

:- use_package(dcg).

frase --> sn, sv.
sn --> 	posesivo(N), nombre(N).
sn --> determinante(N), nombre(N).
sv --> verbo, atributo.
atributo --> sn, cn.
cn --> prep, sn.

posesivo(sing) --> [mi].
posesivo(plur) --> [mis].
posesivo(sing) --> [tu].
posesivo(plur) --> [tus].

nombre(sing) --> [hermano].
nombre(sing) --> [abuelo].
nombre(sing) --> [primo].
nombre(plur) --> [padres].
nombre(plur) --> [tios].
nombre(sing) --> [hijo].
nombre(sing) --> [padre].

verbo --> [es].
determinante(sing) --> [el].
prep --> [de].




%% Pruebas:
% frase([mi,abuelo,es,el,padre,de,mis,padre],R).
% frase([tu,hermano,es,el,hijo,de,tus,padres],R).
% frase([mi,primo,es,el,hijo,de,mi,tios],R).

% frase([mi,primo,es,el,hijo,de,mis,tios,y,de,tus,tios],R).


% Fin del fichero.
















