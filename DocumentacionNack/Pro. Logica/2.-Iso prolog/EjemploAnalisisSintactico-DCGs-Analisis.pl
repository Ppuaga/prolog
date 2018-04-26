% Analisis sintactico: DCGs (muestra el analisis)

:- use_package(dcg).


frase(analisis(S,V)) --> sn(S), sv(V).
sn(sn(A,B)) --> adjetivo(A,N), nombre(B,N).
sn(sn(A,B)) --> determinante(A,N), nombre(B,N).
sv(sv(V,A)) --> verbo(V), atributo(A).
atributo(atrib(S,C)) --> sn(S), cn(C).
cn(cn(P,S)) --> prep(P), sn(S).

adjetivo(adj(mi),sing) --> [mi].
adjetivo(adj(mis),plur) --> [mis].
adjetivo(adj(tu),sing) --> [tu].
adjetivo(adj(tus),plur) --> [tus].

nombre(nom(hermano),sing) --> [hermano].
nombre(nom(abuelo),sing) --> [abuelo].
nombre(nom(primo),sing) --> [primo].
nombre(nom(padres),plur) --> [padres].
nombre(nom(tíos),plur) --> [tios].
nombre(nom(hijo),sing) --> [hijo].
nombre(nom(padre),sing) --> [padre].

verbo(v(es)) --> [es].
determinante(det(el),sing) --> [el].
prep(prep(de)) --> [de].




%% Pruebas:
% frase(A,[mi,abuelo,es,el,padre,de,mi,padre],R).
% frase(A,[tu,hermano,es,el,hijo,de,tus,padres],R).
% frase(A,[mi,primo,es,el,hijo,de,mis,tios],R).

% frase(A,[mi,primo,es,el,hijo,de,mis,tios,y,de,tus,tios],R).


% Fin del fichero.
















