indice([A|R],0,A).
indice([A|R],N,B) :-
           N>0,
           M is N-1,
           indice(R,M,B).