% nos olocamos en la carpeta a traves del terminal y escribimos ciao
% consult('/Users/ignacio/Documents/Pro. logica/P2/Practica2_GarciaMartinIgnacio.pl').
% sortea([q,w,e,r,t,y,u,p,s,d,f,g,h,j,n,k,l,a,ñ,z,x,c,v,i,o,b,m],600,N,P,[n,a,c]).

%Nok es el modulo de N en L
numberOK(L,0,L).
numberOK(Nok,N,L):-
    N > 0,
    N \== L,
    Nok is mod(N,L).
numberOK(N,N,N):- N \== 0.

%Elimina la posición de Ini correspondiente a empezar en P y contar N
%hasta llegar a M en M pasos
contar(X,X,_,_,0).
contar(Ini,Fin,N,P,M):-
    length(Ini,LOIni),
    numberOK(Nb,N,LOIni),
    Elem is Nb+P-1,
    numberOK(Nok,Elem,LOIni),
    elimina(Nok,Ini,L1),
    nextpos(Nok,LOIni,P1),
    M1 is M-1,
    contar(L1,Fin,N,P1,M1).

%X es el número de eliminaciones que hay que hacer para convertir
%la lista Ini en Fin
pasos(Ini,Fin,X):-
    length(Ini,LongIni),
    length(Fin,LongFin),
    X is LongIni - LongFin.

%P1 es la posición por la que comenzar despues de eliminar la posicion
%Nok en LIni
nextpos(Nok,Nok,1):- Nok \== 1.
nextpos(Nok,LIni,P1):- 
    Nok \== LIni,
    P1 is Nok.

sortea(Fin,_,0,0,Fin).
sortea(Ini,C,N,P,Fin):-
length(Ini,LongIni),
    pasos(Ini,Fin,M),
    between(1,C,N),
    between(1,LongIni,P),
    contar(Ini,Fin,N,P,M).


%La segunda lista es la primera lista sin el elemento que ocupa pos
elimina(1,[_|X],X).    
elimina(Pos,[Ini|Inis],[Ini|Inis1]):-
    Pos1 is Pos-1,
    elimina(Pos1,Inis,Inis1).

% sortea([a,b,c,d,e],5,N,P[a,b,c])         N=1,P=4
% sortea([m,m,h,m,h,h,m,h,m,h],20,N,P,[h,h,h,h,h])      N=11,P=2
% sortea([m,m,h,m,h,h,m,h,m,h],500,N,P,[m,m,m,m,m])     N=29,P=10
% sortea([a,b,c],5,N,P,[a,b,c])             N=0,P=0
% sortea([a,b],5,N,P,[a,b,c])               false
% sortea([a,b,c],5,N,P,[a,e])               false
% sortea([e],5,N,P,[])                      false
% sortea([1,1,12,1,1,1,3,1],8,N,P,[12])     N=1,P=4
% sortea([q,w,e,r,t,y,u,p,s,d,f,g,h,j,n,k,l,a,ñ,z,x,c,v,i,o,b,m],600,N,P,[n,a,c])       N=351 P=24
% sortea([q,w,e,r,t,y,u,p,s,d,f,g,j,n,k,l,a,ñ,z,x,c,v,h,b,o,m],600,N,P,[n,a,c,h,o])     N =419  P=25