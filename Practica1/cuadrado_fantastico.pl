%Primer elemento de una lista.
primerElemento([X|_], X).

%Ultimo elemento de una lista.
ultimoElemento([Y], Y).
ultimoElemento([_|Xs], Y):-ultimoElemento(Xs, Y).

%Sumar dos numeros
suma(X,0,X).
suma(A,s(B),s(Y)):-suma(A,B,Y).

%Triplica un natural
triplicar(0,0).
triplicar(s(X),s(s(s(Y)))):-triplicar(X,Y).

%Es cuadrado fantastico secreto
esCuadradoFantasticoSecreto(M, S):-    
		primerElemento(M, L1),
    primerElemento(L1, X1),
    
    ultimoElemento(M, Ln),
    ultimoElemento(Ln, Xn),
    
    suma(X1, Xn, S1),
    
    ultimoElemento(L1, X2),
    primerElemento(Ln, Xn1),
	
    suma(X2, Xn1, S2),
    suma(S1, S2, S3),

    triplicar(S, S3).
