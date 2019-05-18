:- begin_tests(listas).
:- include(lab1).

test(member) :- 
    member(1, [1,2,3,4,5]).
 
test(member) :- 
    member(2, [1,2,3,4,5]).

test(member) :- 
    member(3, [1,2,3,4,5]).

test(member) :- 
    member(4, [1,2,3,4,5]).

test(member) :- 
    member(5, [1,2,3,4,5]).

test(member) :- 
     \+ member(7, [1,2,3,4,5]).

test(reverse) :-
    reverse([a,b], [b,a]).

test(reverse) :-
    reverse([a,b,c], [c,b,a]).

test(reverse) :-
    reverse([a], [a]).

test(reverse) :- 
     \+ reverse([a,b], [b,a,a]).

test(reverse) :- 
     \+ reverse([a,b], [b,b,a]).


test(prefijo) :- 
    prefijo([a,b], []).

test(prefijo) :-
    prefijo([a], [a]).


test(prefijo) :-
    prefijo([a,b,c,d],[a]).


test(prefijo) :-
    prefijo([a,b,c,d], [a,b,c]).

test(prefijo) :-
    prefijo([a,b,c,d], [a,b,c,d]).

test(prefijo) :-
    \+ prefijo([a,b,c,d], [a,b,c,d,e]).

test(prefijo) :-
    \+ prefijo([a,b,c,d], [j,a,b,c,d]).
%----------------------------------------------------

test(subfijo) :- 
    subfijo([a,b], []).

test(subfijo) :-
    subfijo([a], [a]).


test(subfijo) :-
    subfijo([a,b,c,d],[d]).


test(subfijo) :-
    subfijo([a,b,c,d], [b,c,d]).

test(subfijo) :-
    subfijo([a,b,c,d], [a,b,c,d]).

test(subfijo) :-
    \+ subfijo([a,b,c,d], [a,b,c,d,e]).

test(subfijo) :-
    \+ subfijo([a,b,c,d], [j,a,b,c,d]).

test(subfijo) :-
    \+ subfijo([a,b,c,d], [a,b,c]).

%----Principales--------------------------

test(largo) :-
    largo([],0). 

test(largo) :-
    largo([1],1). 

test(largo) :-
    largo([1,2],2). 


test(todos_iguales) :-
    todos_iguales([]). 

test(todos_iguales) :-
    todos_iguales([a]). 

test(todos_iguales) :-
    todos_iguales([1,1]). 

test(todos_iguales) :-
    todos_iguales([1,1,1]). 


test(todos_iguales) :-
   \+ todos_iguales([1,2]). 


test(concatenacion) :- 
    concatenacion([],[], []).


test(concatenacion) :- 
    concatenacion([],[1,2,3], [1,2,3]).


test(concatenacion) :- 
    concatenacion([1,2,3], [],[1,2,3]).


test(concatenacion) :- 
    concatenacion([1,2,3],[4,5,6], [1,2,3,4,5,6]).

test(concatenacion) :- 
    \+ concatenacion([1,2,3],[4,5,6], [1,2,3,4,5,6,7]).

test(contenida) :- 
    contenida([],[]).

test(contenida) :- 
    contenida([],[1]).

test(contenida) :- 
    contenida([1],[1]).

test(contenida) :- 
    contenida([1,1,3,2,1,2,3],[1,2,3]).

test(contenida) :- 
   \+ contenida([4,1,2],[1,2,3]).

test(ww) :- 
    ww([a,b,a,b], [b,a]).

test(ww) :- 
    ww([a,b,a,a,b,a], [b,a]).

test(ww) :- 
    ww([a,b,c,a,b,c], [b,a,c]).

test(ww) :- 
    ww([], [b,a,c]).

test(ww) :- 
    \+ ww([a,a,a], [b,a,c]).


test(wwR) :- 
    wwR([a,b,b,a], [b,a]).

test(wwR) :- 
    wwR([a,b,a,a,b,a], [b,a]).

test(wwR) :- 
    wwR([a,b,c,c,b,a], [b,a,c]).


test(wwR) :- 
    \+ wwR([a,a,a], [b,a,c]).

test(wwR) :- 
   \+ wwR([a,b,c,a,b,c], [b,a,c]).

test(wwR):-
  \+ wwR([j,j], [a,b,c]).

test(sublista) :- 
    sublista([1,2,3,4], []).

test(sublista) :- 
    sublista([1,2,3,4], [1]).

test(sublista) :- 
    sublista([1,2,3,4], [1,2]).

test(sublista) :- 
    sublista([1,2,3,4], [3]).

test(sublista) :- 
    sublista([1,2,3,4], [3,4]).

test(sublista) :- 
    sublista([1,2,3,4], [4]).

test(sublista) :- 
    sublista([1,2,3,4], [2]).

test(sublista) :- 
    \+ sublista([1,2,3,4], [5]).

test(enesimo):-
    enesimo([1,2,3,4] , 1, 1).

test(enesimo):-
    enesimo([1,2,3,4] , 2, 2).

test(enesimo):-
    enesimo([1,2,3,4] , 3, 3).

test(enesimo):-
    enesimo([1,2,3,4] , 4, 4).

test(sin_elem) :- 
     sin_elem([],a,[]).
 
test(sin_elem) :- 
     sin_elem([a,b,c,d,a],a,[b,c,d]).
 
test(sin_elem) :- 
     sin_elem([d,d,d,d],a,[d,d,d,d]).
 
test(sublista) :- 
    sublista([1,2,3,4,5,6,7,8,9], [1,2,3], 1, 3). 

test(sublista) :- 
    sublista([1,2,3,4,5,6,7,8,9], [1,2,3], 1, 3). 

test(sublista) :- 
    sublista([1,2,3,4,5,6,7,8,9], [2,3], 2, 3). 

test(sublista) :- 
    sublista([1,2,3,4,5,6,7,8,9], [5,6,7,8,9], 5, 9). 

test(sublista) :- 
    sublista([1,2,3,4,5,6,7,8,9], [9], 9, 9). 

test(sublista) :- 
    sublista([1,2,3,4,5,6,7,8,9], [1], 1, 1). 

:- end_tests(listas).
