% practica1_ParteI_SandraRanillaCortina.PL
% "Grupo: Ignacio Garcia Martin, Aitor Moya Lopez, Sandra Ranilla Cortina, Rodrigo Rosado Gonzalez"
% "Matricula: U12M071, V13M022, V13M046, V13M018"
% "Practica 1: Automaton"


% " Reglas "
regla(o,o,o,o).
regla(x,o,o,x).
regla(o,x,o,o).
regla(o,o,x,x).
regla(x,o,x,x).
regla(x,x,o,x).
regla(o,x,x,x).
regla(x,x,x,o).