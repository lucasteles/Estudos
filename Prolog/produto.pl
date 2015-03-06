produto(A,0,0).
produto(A,1,A).
produto(A,B,P) :-
           B>1,
           M is B-1,
           produto(A,M,R),
           P is A + R.