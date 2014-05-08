dist_manhattan([at(F1)|_], [at(F2)|_], Dist) :-
	stazione(F1,X1,Y1),
	stazione(F2,X2,Y2),
	X is X1 - X2,
	Y is Y1 - Y2,
	abs(X, Xabs),
	abs(Y, Yabs),
	Dist is Xabs + Yabs,
	writeln(Dist).
	
h(N,DIST) :- finale(S), dist_manhattan(N,S,DIST).
g(G,NUOVA_G) :- NUOVA_G is G + 1.

eur_start :- iniziale(I), finale(F), dist_manhattan(I, F, X), writeln(X).