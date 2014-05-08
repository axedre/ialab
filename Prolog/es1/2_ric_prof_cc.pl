
% Esercizio ricerca in profondità con controllo di cicli

ric_prof_cc(S,_,[]) :- finale(S),!.

% se non è dimostrabile che Nuovo_S sia già stato visitato allora re-invoco ric_prof_cc
ric_prof_cc(S,Visitati,[Az|Resto]) :-
     applicabile(Az,S),
     trasforma(Az,S,Nuovo_S),
     \+ member(Nuovo_S,Visitati),
     ric_prof_cc(Nuovo_S,[S|Visitati],Resto).
	 
% invoco inizialmente ric_prof_cc con una lista vuota indicante i Visitati	 
ric_cc_start :- iniziale(I), ric_prof_cc(I,[],X), writeln(X).
