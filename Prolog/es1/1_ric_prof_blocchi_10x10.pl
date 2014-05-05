
% Esercizio ricerca in profondità

applicabile(est,pos(R,C)) :- 
	num_col(NC), C<NC,
	C1 is C+1,
	\+ occupata(pos(R,C1)).

applicabile(sud,pos(R,C)) :- 
	num_righe(NR), R<NR,
	R1 is R+1,
	\+ occupata(pos(R1,C)).

applicabile(ovest,pos(R,C)) :- 
	C>1,
	C1 is C-1,
	\+ occupata(pos(R,C1)).

applicabile(nord,pos(R,C)) :- 
	R>1,
	R1 is R-1,
	\+ occupata(pos(R1,C)).

trasforma(est,pos(R,C),pos(R,C1)) :- C1 is C+1.
trasforma(ovest,pos(R,C),pos(R,C1)) :- C1 is C-1.
trasforma(sud,pos(R,C),pos(R1,C)) :- R1 is R+1.
trasforma(nord,pos(R,C),pos(R1,C)) :- R1 is R-1.

ric_prof(S,[]) :- finale(S), !.
ric_prof(S,[Az|Resto]) :-
     applicabile(Az,S),
     trasforma(Az,S,Nuovo_S),
     ric_prof(Nuovo_S,Resto).
	 
ric_start :- iniziale(I),ric_prof(I, X), writeln(X).