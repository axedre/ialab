
%Ricerca a profondità limitata

ric_prof_cc_lim(S,_,_,[]) :- finale(S),!.
ric_prof_cc_lim(S,L,Visitati,[Az|Resto]) :-
	L>0,
	applicabile(Az,S),
	trasforma(Az,S,Nuovo_S),
	\+ member(Nuovo_S,Visitati),
	L1 is L-1,
	ric_prof_cc_lim(Nuovo_S,L1,[S|Visitati],Resto).
	
ric_prof_cc_lim_start :- Iniziale(I), ric_prof_cc_lim(I,10,[],X), writeln(X).
	
