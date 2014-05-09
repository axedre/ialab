
%Euristiche per il dominio dei cammini

dist_manhattan(pos(X1,Y1), pos(X2,Y2), Dist) :-
	X is X1 - X2,
	Y is Y1 - Y2,
	abs(X, Xabs),
	abs(Y, Yabs),
	Dist is Xabs + Yabs).
	
h(N,DIST) :- finale(S), dist_manhattan(N,S,DIST).
g(G,NUOVA_G) :- NUOVA_G is G + 1.

eur_start :- iniziale(I), goal(F), dist_manhattan(I, F, X), writeln(X).