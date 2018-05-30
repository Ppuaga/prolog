/*************************************************************************

Este pasatiempo consta de las siguientes afirmaciones:

1. Un alemán y un británico viven cada uno en una casa de diferente color y tienen diferentes mascotas.

2. El alemán vive en la casa verde.
3. Hay un perro en la casa blanca.

Y plantea la siguiente pregunta:
	¿Quién tiene un gato?

*************************************************************************/

:- module(clp_pasatiempo,_).
:- use_package(clpq).


pasatiempo((Aleman,Brit),(Blanco,Verde),(Perro,Gato)):-
	( Aleman .=. 1 ; Aleman .=. 2 ),
	( Brit .=. 1 ; Brit .=. 2 ),

	( Blanco .=. 1 ; Blanco .=. 2 ),
	( Verde .=. 1 ; Verde .=. 2 ),

	( Perro .=. 1 ; Perro .=. 2 ),
	( Gato .=. 1 ; Gato .=. 2 ),

	Aleman .<>. Brit,
	Blanco .<>. Verde,
	Perro .<>. Gato,

	Aleman .=. Verde,
	Perro .=. Blanco.%, !.

