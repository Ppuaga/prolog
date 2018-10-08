juegaEnPartido(X):-
  entrenadorConfia(X), !,
  \+lesionado(X).
entrenadorConfia(X):-esAmable(X).
entrenadorConfia(X):-esPaleto(X).
lesionado(carvajal).
lesionado(benzema).
esAmable(ramos).
esAmable(marcelo).
esPaleto(benzema).
esPaleto(ronaldo).
