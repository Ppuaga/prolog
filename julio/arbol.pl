binary_tree(void).
binary_tree(tree(Element,Left,Right)):-
  binary_tree(Left),
  binary_tree(Right).

pre_order(void,[]).
pre_order(tree(X,Left,Right),Order):-
  pre_order(Left,OrderLeft),
  pre_order(Right,OrderRight),
  append([X|OrderLeft],OrderRight,Order).

/*
  insertar\4 es cierto si y solo si A1 es el árbol resultante de insertar
  el elemento E en el árbol binario (no vacío) A0 en la posición indicada por
  el camino C. El nuevo elemento se incluye como hijo izquierdo del subárbol
  pivote. Si el pivote ya tiene hijo izquierdo, éste se pone como hijo derecho.
  Si el pivote tiene hijo derecho, éste se pone como hijo derecho del subárbol
  del nuevo nodo insertado. En ningún caso el subárbol insertado tiene hijo
  izquierdo.
*/
insertar(tree(Ei,L,R),E,[N|Ns],tree(Ef,Lf,Rf)):-
  New=tree(E,void,X),
  llegar_al_pivote().

llegar_al_pivote().


eliminar(A0,C,E,A1).
