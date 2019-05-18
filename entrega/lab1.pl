
%--------------------------------------------------------------------------------------------
% ----------------------------Comienza Listas------------------------------------------------
%--------------------------------------------------------------------------------------------
%------------auxiliares

%member(?X,+L) <- X es miembro de la lista L
member(X,[X|_Ys]).
member(X,[_Y|Ys]) :- 
    member(X,Ys).


%reverse(+L1,?L2) <- L2 es la lista L1 con los elementos en orden inverso.
reverse([],[]).
reverse([X],[X]).
reverse([X|Xs],R) :- 
    reverse(Xs,T),
    concatenacion(T,[X],R).


%prefijo(L,P) <- P es prefijo de L 
prefijo(L,P) :- concatenacion(P,_,L).


%subfijo(L,S) <- S es subfijo de L
subfijo(L,S) :- concatenacion(_,S,L).

% ---------auxiliar para sublista

%indexOf(+L,+E,?N) <- E es un elemento de L y N es el indice donde se encuentra el elemento E
indexOf([E|_],E,1).
indexOf([_|Xs],E,I) :- 
   indexOf(Xs,E,I1),
   I is I1 + 1.


%indices(+L1,+L2,Is) <- L2 es una lista con elementos de L1, 
%                       Is es una lista de naturales que representa la pocision de los elementos de L2 en la lista L1 
%                       la pocision de un elemento de L2 en L1 pueden ser que ocurra en varios lugares de L1 en este
%                       caso se pone uno solo
indices(_,[],[]).
indices(L1,[X|Xs],[I|R]) :- 
    indexOf(L1,X,I),
    indices(L1,Xs,R).


%head(?L,?E) <- E es el primer elemento de la lista L
head([X],X).
head([X|_Xs],X).
head([],[]).


%contiguos(+L) <- L es una lista de naturales en la que el elemento x_{i+1} == x_{i}+ 1 
contiguos([]).
contiguos([_X]).
contiguos([X|Ys]) :-
    J is X + 1,
    head(Ys,Y),
    Y = J,
    contiguos(Ys).

% ------------------------------------

%-------------------------------------

%largo(+L,?N) <- N es el largo de la lista L
largo([],0).
largo([_X|Xs], N) :- 
    largo(Xs,N1),
    N is 1 + N1.


%todos_iguales(?L) <- Todos los elementos de la lista L son iguales entre si
todos_iguales([]).
todos_iguales([_X]).
todos_iguales([X|Xs]):-
    member(X,Xs),
    todos_iguales(Xs).


%concatenacion(?L1,?L2,?L) <- La lista L es la concatenacion de L1 con L2
concatenacion([],L,L).
concatenacion([H|T],L2,[H|L3])  :-  concatenacion(T,L2,L3).


%contenida(?L1,+L2) <- todos los elementos de la lista L1 pertenecen a L2
contenida([],_L2).
contenida([X|Xs],Ys) :-
    member(X,Ys),
    contenida(Xs,Ys).


%ww(?L,+V) <- La lista L es la concatenacion consigo misma de una lista W 
%             cuyos elementos pertenecen al conjunto representado por la lista V, largo >=2
ww(L,V) :-
    contenida(L,V),
    concatenacion(L1,L1,L).


%wwR(?L,+V) <- La lista L es la concatenacion consigo misma de una lista W 
%              y su reverso con elementos pertenecientes al conjunto representado por la lista V, largo >=2
wwR(L,V) :- 
    contenida(L,V),
    concatenacion(L1,L2,L),
    reverse(L1,L2).


%sublista(?L,?Sub) <- Sub contiene un subconjunto de elementos contiguos de L en el mismo orden
%                     que aparecen en L.
sublista(L,Sub) :- 
    subfijo(L,Subfijo),
    prefijo(Subfijo,Sub).


%enesimo(?L,+N,?E) <- El elemento E esta en la N-sima posición en la lista L
%                     precondicion 0 < N <= largo de la lista N 
enesimo([X|_],1,X).
enesimo([_|Xn],N,E) :-
    N1 is N-1,
    enesimo(Xn,N1,E).


%sin_elem(+L,?E,?LSinE) <- LSinE es la lista L sin ninguna ocurrencia del elemento E.
sin_elem([],_,[]).
sin_elem([X|Xs],X,LSinE) :-
	sin_elem(Xs,X,LSinE).	 
sin_elem([X|Xs],E,[X|Ys]) :-
	sin_elem(Xs,E,Ys).


%sublista(?L,?Sub,?I,?J <- Sub contiene un subconjunto de elementos contiguos de L en el mismo
%                          orden que aparecen en L, empezando en la posición I-ésima de L y terminado en la J-ésima.
sublista(L,Sub,I,J) :-
        subfijo(L,Subfijo),
        prefijo(Subfijo,Sub),
        indices(L,Sub,Indices),
        contiguos(Indices),  
        head(Indices,I),  
        largo(Sub,J1),
        J is I + J1 - 1.

%--------------------------------------------------------------------------------------------
% ----------------------------Comienza Matrices----------------------------------------------
%--------------------------------------------------------------------------------------------

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


%diagonalD2(+M,coord(+I,+J),?Dir) <- Dir es una lista que esta formada por los elementos de una diagonal de la matriz M, con índices de fila y de
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


%diagonalI2(+M,coord(+I,+J),?Inv) <- Inv es una lista que esta formada por elementos de una diagonal inversa de la matriz M, con
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



%--------------------------------------------------------------------------------------------
% ----------------------------Comienza Sopa--------------------------------------------------
%--------------------------------------------------------------------------------------------

%buscarHorizontalIzqADer(+Matriz,+Palabra,?I1,?J1,?I2,?J2) <- Matriz es la matriz de palabras
%                                                             Palabra es la palabra a buscar
%                                                             I1, J1, I2, J2 son las coordenadas de la palabra en la matriz
%                                                             Busca la Palabra de izquierda a derecha en la matriz donde I1, J1 es 
%                                                             donde comienza e I2, J2 donde termina           
buscarHorizontalIzqADer(Matriz,Palabra,I1,J1,I2,J2) :-
    fila(Matriz,I1,Fila),
    sublista(Fila,Palabra,J1,J2),
    I2 = I1.
    

%buscarHorizontalDerAIzq(+Matriz,+Palabra,?I1,?J1,?I2,?J2) <- Matriz es la matriz de palabras
%                                                             Palabra es la palabra a buscar
%                                                             I1, J1, I2, J2 son las coordenadas de la palabra en la matriz
%                                                             Busca la Palabra de derecha a izquierda en la matriz donde I1, J1 es 
%                                                             donde comienza e I2, J2 donde termina
buscarHorizontalDerAIzq(Matriz,Palabra,I1,J1,I2,J2) :-
    fila(Matriz,I1,Fila),
    reverse(Palabra,PalabraR),
    sublista(Fila,PalabraR,J1aux,J2aux),
    J1 = J2aux,
    J2 = J1aux,
    I2 = I1.

    
%buscarVerticalArribaAbajo(+Matriz,+Palabra,?I1,?J1,?I2,?J2) <- Matriz es la matriz de palabras
%                                                               Palabra es la palabra a buscar
%                                                               I1, J1, I2, J2 son las coordenadas de la palabra en la matriz
%                                                               Busca la Palabra de arriba a abajo en la matriz donde I1, J1 es 
%                                                               donde comienza e I2, J2 donde termina
buscarVerticalArribaAbajo(Matriz,Palabra,I1,J1,I2,J2) :-
    col(Matriz,J1,Columna),
    sublista(Columna,Palabra,I1,I2),
    J2 = J1.


%buscarVerticalAbajoArriba(+Matriz,+Palabra,?I1,?J1,?I2,?J2) <- Matriz es la matriz de palabras
%                                                               Palabra es la palabra a buscar
%                                                               I1, J1, I2, J2 son las coordenadas de la palabra en la matriz
%                                                               Busca la Palabra de abajo a arriba en la matriz donde I1, J1 es 
%                                                               donde comienza e I2, J2 donde termina
buscarVerticalAbajoArriba(Matriz,Palabra,I1,J1,I2,J2) :-
    col(Matriz,J1,Columna),
    reverse(Palabra,PalabraR),
    sublista(Columna,PalabraR,I1aux,I2aux),
    I1 = I2aux,
    I2 = I1aux,
    J2 = J1.


%buscarDiagonalDDirecto(+Matriz,+Palabra,?I1,?J1,?I2,?J2) <- Matriz es la matriz de palabras
%                                                            Palabra es la palabra a buscar
%                                                            I1, J1, I2, J2 son las coordenadas de la palabra en la matriz
%                                                            Busca la Palabra en forma diagonal de izquierda a derecha en la matriz donde I1, J1 es 
%                                                            donde comienza e I2, J2 donde termina
buscarDiagonalDDirecto(Matriz,Palabra,I1,J1,I2,J2) :-
   J=1,
   diagonalD(Matriz,coord(I,J),Diagonal),
   sublista(Diagonal,Palabra,I1aux,J1aux),
   J1 is I1aux,
   J2 is J1aux,
   I1 is I + I1aux -1,
   I2 is I + J1aux -1.
buscarDiagonalDDirecto(Matriz,Palabra,I1,J1,I2,J2) :-
   I=1,
   diagonalD(Matriz,coord(I,J),Diagonal),
   sublista(Diagonal,Palabra,I1aux,J1aux),
   I1 is I1aux,
   I2 is J1aux,
   J1 is J + I1aux -1,
   J2 is J + J1aux -1.


%buscarDiagonalDReverso(+Matriz,+Palabra,?I1,?J1,?I2,?J2) <- Matriz es la matriz de palabras
%                                                            Palabra es la palabra a buscar
%                                                            I1, J1, I2, J2 son las coordenadas de la palabra en la matriz
%                                                            usca el reverso de la Palabra en forma diagonal de izquierda a derechaen
%                                                            la matriz donde I1, J1 es donde comienza e I2, J2 donde termina
buscarDiagonalDReverso(Matriz,Palabra,I1,J1,I2,J2) :-
   reverse(Palabra,PalabraR),
   buscarDiagonalDDirecto(Matriz,PalabraR,I2,J2, I1,J1 ).
   

%buscarDiagonalIDirecto(+Matriz,+Palabra,?I1,?J1,?I2,?J2) <- Matriz es la matriz de palabras
%                                                            Palabra es la palabra a buscar
%                                                            I1, J1, I2, J2 son las coordenadas de la palabra en la matriz
%                                                            Busca la Palabra en forma diagonal de derecha a izquierda en la matriz donde I1, J1 es 
%                                                            donde comienza e I2, J2 donde termina
buscarDiagonalIDirecto(Matriz,Palabra,I1,J1,I2,J2) :-
   J=1,
   diagonalI(Matriz,coord(I,J),Diagonal),
   sublista(Diagonal,Palabra,I1aux,J1aux),
   J1 is I1aux,
   J2 is J1aux,
   I1 is I + I1aux -1,
   I2 is I - J1aux +1.
buscarDiagonalIDirecto(Matriz,Palabra,I1,J1,I2,J2) :-
   matriz(F,_C,Matriz),
   I=F,
   diagonalI(Matriz,coord(I,J),Diagonal),
   sublista(Diagonal,Palabra,I1aux,J1aux),
   I1 is I - I1aux + 1,
   I2 is I - J1aux + 1,
   J1 is J + I1aux - 1,
   J2 is J + J1aux - 1.


%buscarDiagonalIReverso(+Matriz,+Palabra,?I1,?J1,?I2,?J2) <- Matriz es la matriz de palabras
%                                                            Palabra es la palabra a buscar
%                                                            I1, J1, I2, J2 son las coordenadas de la palabra en la matriz
%                                                            Busca el inverso de la Palabra en forma diagonal de derecha a izquierda
%                                                            en la matriz donde I1, J1 es donde comienza e I2, J2 donde termina
buscarDiagonalIReverso(Matriz,Palabra,I1,J1,I2,J2) :-
   reverse(Palabra,PalabraR),
   buscarDiagonalIDirecto(Matriz,PalabraR,I2,J2, I1,J1 ).

    
%buscarHorizontal(+Matriz,+Palabra,?I1,?J1,?I2,?J2) <- Matriz es la matriz de palabras
%                                                      Palabra es la palabra a buscar
%                                                      I1, J1, I2, J2 son las coordenadas de la palabra en la matriz
%                                                      Busca la Palabra de izquierda a derecha y de derecha a izquierda  
%                                                      en la matriz donde I1, J1 es donde comienza e I2, J2 donde termina
buscarHorizontal(Matriz,Palabra,I1,J1,I2,J2) :-
    buscarHorizontalIzqADer(Matriz,Palabra,I1,J1,I2,J2).
buscarHorizontal(Matriz,Palabra,I1,J1,I2,J2) :-
    buscarHorizontalDerAIzq(Matriz,Palabra,I1,J1,I2,J2).
 

%buscarVertical(+Matriz,+Palabra,?I1,?J1,?I2,?J2) <- Matriz es la matriz de palabras
%                                                    Palabra es la palabra a buscar
%                                                    I1, J1, I2, J2 son las coordenadas de la palabra en la matriz
%                                                    Busca la Palabra de arriba a abajo y de abajo a arriba  
%                                                    en la matriz donde I1, J1 es donde comienza e I2, J2 donde termina
buscarVertical(Matriz,Palabra,I1,J1,I2,J2) :-
    buscarVerticalArribaAbajo(Matriz,Palabra,I1,J1,I2,J2).
buscarVertical(Matriz,Palabra,I1,J1,I2,J2) :-
    buscarVerticalAbajoArriba(Matriz,Palabra,I1,J1,I2,J2).


%buscarDiagonal(+Matriz,+Palabra,?I1,?J1,?I2,?J2) <- Matriz es la matriz de palabras
%                                                    Palabra es la palabra a buscar
%                                                    I1, J1, I2, J2 son las coordenadas de la palabra en la matriz
%                                                    Busca la Palabra en forma diagonal de derecha a izquierda de forma directa e inversa
%                                                    y de izquierda a derecha e inversa en la matriz donde I1, J1 es donde comienza e 
%                                                    I2, J2 donde termina
buscarDiagonal(Matriz,Palabra,I1,J1,I2,J2) :-
    buscarDiagonalDDirecto(Matriz,Palabra,I1,J1,I2,J2).
buscarDiagonal(Matriz,Palabra,I1,J1,I2,J2) :-
    buscarDiagonalDReverso(Matriz,Palabra,I1,J1,I2,J2).
buscarDiagonal(Matriz,Palabra,I1,J1,I2,J2) :-
    buscarDiagonalIDirecto(Matriz,Palabra,I1,J1,I2,J2).
buscarDiagonal(Matriz,Palabra,I1,J1,I2,J2) :-
    buscarDiagonalIReverso(Matriz,Palabra,I1,J1,I2,J2).


%buscarPalabra(+Matriz,+Palabra,?Coord) <- Matriz es la matriz de palabras
%                                          Palabra es la palabra a buscar
%                                          I1, J1, I2, J2 son las coordenadas de la palabra en la matriz
%                                          Busca la Palabra en la Matriz de cualquier posicion posible
buscarPalabra(Matriz,Palabra,Coord) :-
    buscarHorizontal(Matriz,Palabra,I1,J1,I2,J2),
    Coord=p(Palabra,[(I1,J1),(I2,J2)]).
buscarPalabra(Matriz,Palabra,Coord):- 
    buscarVertical(Matriz,Palabra,I1,J1,I2,J2),
    Coord=p(Palabra,[(I1,J1),(I2,J2)]).
buscarPalabra(Matriz,Palabra,Coord) :- 
    buscarDiagonal(Matriz,Palabra,I1,J1,I2,J2),
    Coord=p(Palabra,[(I1,J1),(I2,J2)]).


%sopa(+M,+Pals,?Coords) <- - Coords es una lista de elementos de la forma p(Pal,((I1,J1),(I2,J2)))
%                          - donde ((I1,J1),(I2,J2)) es el par de coordenadas que indica los índices inicial y final
%                            de la palabra Pal (lista de letras) en la matriz M
%                          - debe haber un elemento en Coords para cada palabra de Pals
sopa(_Matriz,[],[]).
sopa(Matriz,[Palabra|Px],[Coord|Cx]):-
    buscarPalabra(Matriz,Palabra,Coord),
    sopa(Matriz,Px,Cx).





