:- [matrices].

verificarsopa :- 
M= [[a,c,a,v,d,c,k,c],
    [o,y,w,l,o,b,a,e], 
    [v,s,m,n,z,n,k,r],
    [a,o,e,p,i,p,o,d],
    [p,j,v,l,o,t,u,o],
    [o,w,l,e,a,l,p,e],
    [o,a,q,p,j,t,l,w],
    [g,j,q,i,t,a,e,o] 
   ], 
matriz(_I,_J,M).



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
