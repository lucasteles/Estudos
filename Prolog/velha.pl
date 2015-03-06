cruz(N,Tab) :- arg(N,Tab,V), nonvar(V), V=x.
bola(N,Tab) :- arg(N,Tab,V), nonvar(V), V=o.
vazia(N,Tab) :- arg(N,Tab,V), var(V).
cheia(N,Tab) :- \+ vazia(N,Tab).


proximo(player1,player2).
proximo(player2,player1).

caracPlayer(player1,'x').
caracPlayer(player2,'o').

%desenho de tabuleiro
exibeJogo(T,J):- write('jogou:'),write(J),desenha(T).

desenha(T) :- nl, tab(7),wrtLinha(1,2,3,T), tab(7),write('------'),nl,
tab(7),wrtLinha(4,5,6,T), tab(7),write('------'),nl,
tab(7),wrtLinha(7,8,9,T).

wrtLinha(X,Y,Z,T):-arg(X,T,V1), wVal(V1),write('|'),
arg(Y,T,V2), wVal(V2),write('|'),arg(Z,T,V3), wVal(V3),nl.

wVal(X):- var(X)->write(' '); write(X).


% valdiações
valida([1,2,3]).
valida([4,5,6]).
valida([7,8,9]).
valida([1,4,7]).
valida([2,5,8]).
valida([3,6,9]).
valida([1,5,9]).
valida([3,5,7]).

preenche(XO,T):- member(X,[1,2,3,4,5,6,7,8,9]),vazia(X,T),arg(X,T,XO),!,preenche(XO,T).
preenche(XO,T).

gameOver(T,empate) :- empate(T).
gameOver(T, R) :- vence(T,R).

vence(T,venceu(cruz)):- valida([A,B,C]), cruz(A,T),cruz(B,T),cruz(C,T),!.
vence(T,venceu(bola)):- valida([A,B,C]), bola(A,T),bola(B,T),bola(C,T),!.
empate(T):- preenche(o,T),\+ vence(T,_),!,preenche(x,T),\+ vence(T,_).


%regras de jogo
escolheMov(T, Player):- write('jogue (1..9):'), nl , read(P),testaOk(P,T,Player).

testaOk(P,Tab,Player) :- vazia(P,Tab), caracPlayer(Player,C), arg(P,Tab,C),!;
write('Jogada invalida!'),nl, escolheMov(Tab,Player).


jogar(T, Jogador):- gameOver(T,Result),!,write('GAME OVER:'), write(Result),nl,nl.
jogar(T, Jogador):- escolheMov(T, Jogador),!,
exibeJogo(T, Jogador),!,
proximo(Jogador, Oponente), !,
jogar(T, Oponente).


%principal
velha :- T = tab(A,B,C, D,E,F, G,H,I),
              exibeJogo(T, inicio), jogar(T, player1).