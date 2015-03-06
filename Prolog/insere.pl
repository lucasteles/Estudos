insere(V,0,[X|XS],[V,X|XS]).
insere(V,I,[X|XS],R) :-
           M is I-1,
           insere(V,M,XS,L),
           append([X],L,R).