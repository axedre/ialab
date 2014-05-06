
% Esercizio ricerca in profondità

ric_prof(S,[]) :- finale(S), !.
ric_prof(S,[Az|Resto]) :-
     applicabile(Az,S),
     trasforma(Az,S,Nuovo_S),
     ric_prof(Nuovo_S,Resto).
	 
ric_start :- iniziale(I),ric_prof(I, X), writeln(X).