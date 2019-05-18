:- [sopa].

solversopa1 :-
Matriz1=[
[s,w,l,o,o,p,r,e,v,i,l,i,o,d,l,a],
[a,y,e,s,l,d,a,t,e,f,j,b,i,j,k,s],
[f,y,j,u,t,o,g,j,j,m,o,y,m,o,i,e],
[i,f,e,x,r,i,a,c,h,u,e,l,o,q,o,h],
[r,a,v,p,y,r,r,v,s,m,x,o,w,q,e,n],
[o,h,f,h,p,k,g,e,z,a,q,k,z,o,b,k],
[m,e,c,h,a,v,a,t,q,u,e,u,o,e,d,u],
[o,x,w,n,g,e,n,n,u,l,a,p,e,k,x,k],
[f,i,j,o,e,o,t,a,a,o,l,w,r,s,y,y],
[b,e,l,o,q,i,a,m,s,c,f,n,s,q,o,x],
[v,o,a,t,v,e,a,a,i,a,i,l,l,f,o,i],
[r,a,m,i,u,u,g,i,m,s,l,s,c,l,o,k],
[r,k,t,i,g,n,m,d,h,a,e,u,i,m,i,e],
[o,e,s,t,o,r,n,u,d,o,r,f,g,l,s,u],
[y,r,a,l,h,q,a,r,b,o,l,o,o,g,i,y],
[f,i,t,o,p,p,m,n,e,d,l,e,u,a,t,l]
],
Palabras1=[
[m,i,s,a],
[c,a,s,a],
[m,e,c,h,a],
[s,a,f,i,r,o],
[d,i,a,m,a,n,t,e],
[e,s,t,o,r,n,u,d,o],
[a,l,f,i,l,e,r],
[f,i,l,o],
[g,a,r,g,a,n,t,a],
[h,i,j,o],
[k,i,l,o],
[l,i,v,e,r,p,o,o,l],
[q,u,e,s,o],
[r,i,a,c,h,u,e,l,o]
],
sopa(Matriz1,Palabras1,Solucion1),
print(Solucion1).


solverSopa :-
    M= [[a,c,a,v,d,c,k,c],
        [o,y,w,l,o,b,a,e], 
        [v,s,m,n,z,n,k,r],
        [a,o,e,p,i,p,o,d],
        [p,j,v,l,o,t,u,o],
        [o,w,l,e,a,l,p,e],
        [o,a,q,p,j,t,l,w],
        [g,j,q,i,t,a,e,o] 
       ], 
    Palabras= [[c,e,r,d,o],[p,a,t,o],[c,o,n,e,j,o],[p,a,v,o],[g,a,l,l,i,n,a],[p,o,l,l,o],[o,v,e,j,a],[v,a,c,a]],
    sopa(M,Palabras,Solucion),
    print(Solucion).


solverDiagonalIReverso :- 
    M= [[a,c,a,v,d,c,k,c],
        [o,y,w,l,o,b,a,e], 
        [v,s,m,n,z,n,k,r],
        [a,o,e,p,i,p,o,d],
        [p,j,v,l,o,t,u,o],
        [o,w,l,e,a,l,p,e],
        [o,a,q,p,j,t,l,w],
        [g,j,q,i,t,a,e,o] 
       ], 
    P=[o,t,a],
    buscarDiagonalIReverso(M,P,I1,J1,I2,J2),
    print(I1),
    print(' '),
    print(J1),
    print(' '),
    print(I2),
    print(' '),
    print(J2).




solverDiagonalIDirecto :- 
    M= [[a,c,a,v,d,c,k,c],
        [o,y,w,l,o,b,a,e], 
        [v,s,m,n,z,n,k,r],
        [a,o,e,p,i,p,o,d],
        [p,j,v,l,o,t,u,o],
        [o,w,l,e,a,l,p,e],
        [o,a,q,p,j,t,l,w],
        [g,j,q,i,t,a,e,o] 
       ], 
    P=[o,j,e,n,o,c],
    buscarDiagonalIDirecto(M,P,I1,J1,I2,J2),
    print(I1),
    print(' '),
    print(J1),
    print(' '),
    print(I2),
    print(' '),
    print(J2).



solverHorizontal :- 
    M= [[a,c,a,v,d,c,k,c],
        [o,y,w,l,o,b,a,e], 
        [v,s,m,n,z,n,k,r],
        [a,o,e,p,i,p,o,d],
        [p,j,v,l,o,t,u,o],
        [o,w,l,e,a,l,p,e],
        [o,a,q,p,j,t,l,w],
        [g,j,q,i,t,a,e,o] 
       ], 
    P=[p,i,p,o],
    buscarHorizontalIzqADer(M,P,I1,J1,I2,J2), 
    print(I1),
    print(J1),
    print(I2),
    print(J2).

solverHorizontalR :- 
    M= [[a,c,a,v,d,c,k,c],
        [o,y,w,l,o,b,a,e], 
        [v,s,m,n,z,n,k,r],
        [a,o,e,p,i,p,o,d],
        [p,j,v,l,o,t,u,o],
        [o,w,l,e,a,l,p,e],
        [o,a,q,p,j,t,l,w],
        [g,j,q,i,t,a,e,o] 
       ], 
    P=[v,a,c,a],
    buscarHorizontalDerAIzq(M,P,I1,J1,I2,J2), 
    print(I1),
    print(J1),
    print(I2),
    print(J2).

solverVerticalArribaAbajo :- 
    M= [[a,c,a,v,d,c,k,c],
        [o,y,w,l,o,b,a,e], 
        [v,s,m,n,z,n,k,r],
        [a,o,e,p,i,p,o,d],
        [p,j,v,l,o,t,u,o],
        [o,w,l,e,a,l,p,e],
        [o,a,q,p,j,t,l,w],
        [g,j,q,i,t,a,e,o] 
       ], 
    P=[c,e,r,d,o],
    buscarVerticalArribaAbajo(M,P,I1,J1,I2,J2), 
    print(I1),
    print(J1),
    print(I2),
    print(J2).


solverVerticalAbajoArriba :- 
    M= [[a,c,a,v,d,c,k,c],
        [o,y,w,l,o,b,a,e], 
        [v,s,m,n,z,n,k,r],
        [a,o,e,p,i,p,o,d],
        [p,j,v,l,o,t,u,o],
        [o,w,l,e,a,l,p,e],
        [o,a,q,p,j,t,l,w],
        [g,j,q,i,t,a,e,o] 
       ], 
    P=[p,a,v,o],
    buscarVerticalAbajoArriba(M,P,I1,J1,I2,J2), 
    print(I1),
    print(J1),
    print(I2),
    print(J2).

solverDiagonalDDirecto :- 
    M= [[a,c,a,v,d,c,k,c],
        [o,y,w,l,o,b,a,e], 
        [v,s,m,n,z,n,k,r],
        [a,o,e,p,i,p,o,d],
        [p,j,v,l,o,t,u,o],
        [o,w,l,e,a,l,p,e],
        [o,a,q,p,j,t,l,w],
        [g,j,q,i,t,a,e,o] 
       ], 
    P=[s,e,l,a],
    buscarDiagonalDDirecto(M,P,I1,J1,I2,J2), 
    print(I1),
    print(J1),
    print(I2),
    print(J2).

solverDiagonalDReverso :- 
    M= [[a,c,a,v,d,c,k,c],
        [o,y,w,l,o,b,a,e], 
        [v,s,m,n,z,n,k,r],
        [a,o,e,p,i,p,o,d],
        [p,j,v,l,o,t,u,o],
        [o,w,l,e,a,l,p,e],
        [o,a,q,p,j,t,l,w],
        [g,j,q,i,t,a,e,o] 
       ], 
    P=[l,e,s],
    buscarDiagonalDReverso(M,P,I1,J1,I2,J2), 
    print(I1),
    print(J1),
    print(I2),
    print(J2).