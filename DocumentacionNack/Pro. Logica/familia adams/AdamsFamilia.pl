padre_de(homero,merlina).
padre_de(homero,pericles).
madre_de(morticia,merlina).
madre_de(morticia,pericles).
madre_de(abuAdams,homero).
madre_de(abuAdams,tLucas).
madre_de(abuAdams,tCosa).
bro_de(pericles,merlina).
bro_de(homero,tLucas).
bro_de(tLucas,homero).
bro_de(homero,tCosa).
bro_de(tCosa,homero).
bro_de(tLucas,tCosa).
bro_de(tCosa,tLucas).



man(pericles).
man(homero).
man(tLucas).
man(tCosa).

woman(morticia).
woman(merlina).
woman(abuAdams).

conyuge_de(morticia,homero).

hijo_de(X,Y):-padre_de(Y,X),man(X).
hijo_de(X,Y):-madre_de(Y,X),man(X).

hija_de(X,Y):-padre_de(Y,X),woman(X).
hija_de(X,Y):-madre_de(Y,X),woman(X).

hermano_de(X,Y):-bro_de(X,Y),man(X).
hermana_de(X,Y):-bro_de(X,Y),woman(X).

tio_de(Z,Y):-madre_de(X,Y),hermano_de(Z,X).
tio_de(Z,Y):-padre_de(X,Y),hermano_de(Z,X).

tia_de(Z,Y):-madre_de(X,Y),hermana_de(Z,X).
tia_de(Z,Y):-padre_de(X,Y),hermana_de(Z,X).

abuelo_de(X,Z):-padre_de(X,Y),padre_de(Y,Z).
abuelo_de(X,Z):-padre_de(X,Y),madre_de(Y,Z).

abuela_de(X,Z):-madre_de(X,Y),padre_de(Y,Z).
abuela_de(X,Z):-madre_de(X,Y),madre_de(Y,Z).

sobrino_de(X,Y):-hijo_de(X,Z),bro_de(Z,Y),not(hijo_de(X,Y)).
sobrina_de(X,Y):-hija_de(X,Z),bro_de(Y,Z),not(hija_de(X,Y)).

cunado_de(X,Y):-conyuge_de(Y,Z),bro_de(X,Z),man(X).
cunado_de(X,Y):-conyuge_de(X,Z),bro_de(Y,Z),man(X).

cunada_de(X,Y):-conyuge_de(X,Z),bro_de(Y,Z),woman(X).
cunada_de(X,Y):-conyuge_de(Y,Z),bro_de(X,Z),woman(X).

suegro_de(Y,X):-conyuge_de(X,Z),padre_de(Y,Z).
suegra_de(Y,X):-conyuge_de(X,Z),madre_de(Y,Z).

consuegro_de(Z,X):-padre_de(X,Y),suegro_de(Z,Y).
consuegro_de(Z,X):-madre_de(X,Y),suegro_de(Z,Y).

consuegra_de(Z,X):-padre_de(X,Y),suegra_de(Z,Y).
consuegra_de(Z,X):-madre_de(X,Y),suegra_de(Z,Y).