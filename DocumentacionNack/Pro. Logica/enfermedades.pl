%
% Ejemplo sobre relaciones enfermedades
%

%
% Código ISO-Prolog
%

%
% Hechos iniciales:			
%

enfermo_de(manuel,gripe).
enfermo_de(manuel,hepatitis).
enfermo_de(ignacio,hepatitis).
enfermo_de(ana,gripe).
enfermo_de(jose,intoxicacion).

sintoma_de(fiebre,gripe).
sintoma_de(cansancio,gripe).
sintoma_de(cansancio,hepatitis).
sintoma_de(diarrea,intoxicacion).

suprime(aspirina,fiebre).
suprime(lomotil,diarrea).

%
% Definición mediante reglas:
%

recetar_a(X,Y):-
  enfermo_de(Y,A),suprime(X,A).

alivia(X,Y):-
  suprime(X,A),sintoma_de(A,Y).


% ¿Podemos conocer qué dolencia tiene Manuel? ¿Y Ana?
% enfermo_de(manuel,X).
% enfermo_de(ana,Y).

% ¿Quién padece gripe?
% enfermo_de(A,gripe)

% ¿Qué síntomas tiene José?
% enfermo_de(jose,_Enfermedad),sintoma_de(S,_Enfermedad).

% ¿Quién padece diarrea?

% ¿Quién está cansado?
% sintoma_de(cansancio,_E), enfermo_de(P,_E).

% ¿Hay algún medicamento que alivie a Manuel?
% enfermo_de(manuel,_E), alivia(M,_E).

% ¿Hay algún síntoma que compartan Ignacio y Ana?
% enfermo_de(ignacio,_E1),enfermo_de(ana,_E2),sintoma_de(S,_E1),sintoma_de(S,_E2).


% Fin del fichero.
