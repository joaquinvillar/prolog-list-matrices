:- [listas].


%matriz(?M,?N,+A) <- A es una matriz de M filas y N columnas.  La matriz se representa mediante
%                    una lista de M filas, donde cada fila es una lista de N celdas.
matriz(0,_,[]).
matriz(M, N, [X|Xs]) :- 
    largo([X|Xs],M),
    largo(X,N),
    M1 is M -1,
    matriz(M1,N,Xs).
    

%valor_celda(+I,+J,+A,?E) <- E es el contenido de la celda (I,J) de la matriz A.
valor_celda(I,J,A,E) :- 
    enesimo(A,I,Fila),
    enesimo(Fila,J,E). 


%fila(+M,?N,?F) <- F es la fila N-ésima de la matriz
fila([F|_],1,F).
fila([_X|Xs],N,F) :-
    fila(Xs,N1,F),
    N is N1+1.   


%col(+M,?N,?C) <- es la columna N-ésima de la matriz
col([F],N,[C1]) :-
    fila(F,N,C1).
col([F|Fs],N,[C1|C]) :-
    fila(F,N,C1),
    col(Fs,N,C).


%diagonalD(+M,coord(?I,?J),?Dir) <- Dir es una diagonal de la matriz M, con índices de fila y de
%                                   columna consecutivos crecientes. El 1er elemento de Dir tiene coordenadas I,J. Los elementos de
%                                   la fila 1 y los de la columna 1 son los posibles 1eros elementos de Dir
diagonalD(M,coord(I,J),[Z|Y]) :-
    matriz(_F,C,M),
    I=1,
    fila(M,I,F1),
    fila(F1,J,Z),
    I1 is I+1,
    J1 is J+1,
    J =< C,
    diagonalD2(M,coord(I1,J1),Y).
diagonalD(M,coord(I,J),[Z|Y]) :-
    matriz(F,_C,M),
    fila(M,I,F1),
    J = 1,
    fila(F1,J,Z),
    I=<F,
    I1 is I+1,
    J1 is J+1,
    diagonalD2(M,coord(I1,J1),Y).


%diagonalD2(+M,coord(+I,+J),?Dir) <- Dir es una diagonal de la matriz M, con índices de fila y de
%                                   columna consecutivos crecientes. El 1er elemento de Dir tiene coordenadas a partir de I,J.
diagonalD2(M,coord(I,J),[Z|Y]) :-
    matriz(F,C,M),
    fila(M,I,Fi),
    fila(Fi,J,Z),
    I1 is I+1,
    J1 is J+1,
    I =< F,
    J =< C,
    diagonalD2(M,coord(I1,J1),Y).
diagonalD2(M,coord(I,_J),[]) :-
    matriz(F,_C,M), 
    I > F.
diagonalD2(M,coord(_I,J),[]) :-
    matriz(_F,C,M),     
    J > C.   


%diagonalI(+M,coord((?I,?J),?Inv) <- Inv es una una diagonal inversa de la matriz M, con
%                                    índices de fila consecutivos decrecientes y de columna consecutivos crecientes. El 1er elemento
%                                    de Inv tiene coordenadas I,J. Los elementos de la columna 1 y los de la última fila son los
%                                    posibles 1eros elementos de Inv
diagonalI(M,coord(I,J),[Z|Y]) :-
    matriz(F,C,M),
    I=F,
    fila(M,I,Fi),
    fila(Fi,J,Z),
    I1 is I-1,
    J1 is J+1,
    J =< C,
    diagonalI2(M,coord(I1,J1),Y).
diagonalI(M,coord(I,J),[Z|Y]) :-
    matriz(_F,C,M),
    fila(M,I,Fi),
    J=1,
    fila(Fi,J,Z),
    I1 is I-1,
    J1 is J+1,
    J =< C,
    I > 0,
    diagonalI2(M,coord(I1,J1),Y).


%diagonalI2(+M,coord(+I,+J),?Inv) <- Inv es una una diagonal inversa de la matriz M, con
%                                    índices de fila consecutivos decrecientes y de columna consecutivos crecientes. El 1er elemento
%                                    de Inv tiene coordenadas a partir de I,J.
diagonalI2(M,coord(I,J),[Z|Y]) :-
    matriz(_F,C,M),
    fila(M,I,Fi),
    fila(Fi,J,Z),
    I1 is I-1,
    J1 is J+1,
    J =< C,
    I > 0,
    diagonalI2(M,coord(I1,J1),Y).
diagonalI2(M,coord(_I,J),[]) :-
    matriz(_F,C,M), 
    J > C.
diagonalI2(M,coord(I,_J),[]) :-
    matriz(_F,_C,M),     
    I = 0.
