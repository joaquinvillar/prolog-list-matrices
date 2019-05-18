:- begin_tests(matrices).


%matriz
test(matriz, all(X = [3])) :-
    matriz(X,3,[[8,-10,1],[5,4,2], [7,9,3]]).

test(matriz, all(X = [1])) :-
    matriz(3,_,[[8,-10,X],[5,4,2], [7,9,3]]).

test(matriz, all(X = [1])) :-
    matriz(_,3,[[8,-10,X],[5,4,2], [7,9,3]]).

test(matriz) :-
    \+ matriz(3,2,[[8,-10,1],[5,4,2], [7,9,3]]).

test(matriz) :-
    \+ matriz(2,3,[[8,-10,1],[5,4,2], [7,9,3]]).

test(matriz) :-
    \+ matriz(2,2,[[8,-10,1],[5,4,2], [7,9,3]]).

test(matriz) :-
    \+ matriz(3,3,[[8,-10],[5,4,2], [7,9,3]]).

test(matriz) :-
    \+ matriz(3,3,[[8,-10,1],[5,4], [7,9,3]]).

test(matriz) :-
    \+ matriz(2,3,[[8,-10,1],[5,4,2], [7,9]]).

test(matriz) :-
    \+ matriz(3,3,[[8,-10,1],[5,4], _]).


%valor_celda
test(valor_celda, all(X = [1])) :-
    valor_celda(2,1,[[8,-10,X],[5,4,2], [7,9,3]],5).

test(valor_celda, all(X = [1])) :-
    valor_celda(2,1,[[8,-10,X],[5,4,2], [7,9,3]],_).

test(valor_celda, all(X = [1])) :-
    valor_celda(2,1,[[8,X],[5,4], [7,9]],5).

test(valor_celda, all(X = [1])) :-
    \+ valor_celda(2,1,[[8,-10,X],[5,4,2], [7,9,9]],3).


%fila
test(fila, all(X = [1])) :-
    fila([[8,-10,X],[5,4,2],[7,9,3]],3,[7,9,3]).

test(fila, all(X = [1])) :-
    fila([[8,-10,X],[5,4,2],[7,9,3]],_,[7,9,3]).

test(fila, all(X = [1])) :-
    fila([[8,-10,X],[5,4,2],[7,9,3]],3,_).


%col
test(col, all(X = [1])) :-
    col([[8,-10,X],[5,4,2],[7,9,3]],2,[-10,4,9]).


%diagonalD
test(diagonalD) :-
    diagonalD([[8,-10,1],[5,4,2], [7,9,3]],coord(1,2),[-10,2]).

test(diagonalD) :-
    diagonalD([[8,-10,1],[5,4,2], [7,9,3]],coord(2,1),[5,9]).

test(diagonalD) :-
    diagonalD([[8,-10,1],[5,4,2], [7,9,3]],coord(1,1),[8,4,3]).

test(diagonalD) :-
    diagonalD([[8,-10,1],[5,4,2], [7,9,3]],coord(3,1),[7]).


%diagonalI
test(diagonalI) :-
    diagonalI([[8,-10,1],[5,4,2], [7,9,3]],coord(3,2),[9,2]).

:- end_tests(matrices).