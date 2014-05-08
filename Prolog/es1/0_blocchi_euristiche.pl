
%Euristiche mondo dei blocchi

my_length([],0).
my_length([_|L],N) :- my_length(L,N1), N is N1 + 1.

eur(S1, S2, Ris) :- 
	ord_subtract(S1,S2,SDiff1),
	my_length(SDiff1, NSDiff1),
	writeln(NSDiff1),
	Ris is abs(NSDiff1)-1.

h(N,DIST) :- goal(S), eur(N,S,DIST).
g(G,NUOVA_G) :- NUOVA_G is G + 1.

eur_start :- iniziale(I), goal(F), eur(I, F, X), writeln(X).