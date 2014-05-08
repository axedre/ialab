
%Euristiche mondo dei blocchi

my_length([],0).
my_length([_|L],N) :- my_length(L,N1), N is N1 + 1.

eur(S1, S2, Ris) :- 
	ord_intersection(S1, S2, SInt, SDiff),
	my_length(SInt, NSInt),
	my_length(SDiff, NSDiff),
	Ris is abs(NSInt - NSDiff +1).
	
eur_start :- iniziale(I), goal(F), eur(I, F, X), writeln(X).