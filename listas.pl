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


%todos_iguales([X,X]) <-
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
