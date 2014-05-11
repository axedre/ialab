dist_eucl([at(F1)|_], [at(F2)|_], Dist) :-
	stazione(F1,X1,Y1),
	stazione(F2,X2,Y2),
	Xdiff is X1 - X2,
	XExp is Xdiff * Xdiff,
	Ydiff is Y1 - Y2,
	YExp is Ydiff * Ydiff,
	Somm is XExp + YExp,
	Dist is sqrt(Somm),
	writeln(Dist).
	
h(N,DIST) :- finale(S), dist_eucl(N,S,DIST).
g(G,SP,SA,NUOVA_G) :-
	dist_eucl(SP,SA,Dist),
	Distanza is Dist,
	NUOVA_G is G + Distanza.

eur_start :- iniziale(I), finale(F), dist_eucl(I, F, X), writeln(X).