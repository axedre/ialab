num_col(10).
num_righe(10).

occupata(pos(2,5)).
occupata(pos(3,5)).
occupata(pos(4,5)).
occupata(pos(5,5)).
occupata(pos(6,5)).
occupata(pos(7,5)).
occupata(pos(7,1)).
occupata(pos(7,2)).
occupata(pos(7,3)).
occupata(pos(7,4)).
occupata(pos(5,7)).
occupata(pos(6,7)).
occupata(pos(7,7)).
occupata(pos(8,7)).
occupata(pos(4,7)).
occupata(pos(4,8)).
occupata(pos(4,9)).
occupata(pos(4,10)).

iniziale(pos(4,2)).

finale(pos(7,9)).


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

/** Applica se non è dimostrabile occupata()*/

applicabile(nord,pos(R,C)) :-
	R>1,
	R1 is R-1,
	\+ occupata(pos(R1,C)).

trasforma(est,pos(R,C),pos(R,C1)) :- C1 is C+1.
trasforma(ovest,pos(R,C),pos(R,C1)) :- C1 is C-1.
trasforma(sud,pos(R,C),pos(R1,C)) :- R1 is R+1.
trasforma(nord,pos(R,C),pos(R1,C)) :- R1 is R-1.

<<<<<<< HEAD:Prolog/es1/1-iterative_deepening.pl
ric_prof_cc(S,_,[],_,_) :- finale(S),!.
ric_prof_cc(S,Visitati,[Az|Resto],Depth,Limit) :-
     Depth < Limit,
     Depth1 is Depth+1,
     applicabile(Az,S),
     trasforma(Az,S,Nuovo_S),
     \+ member(Nuovo_S,Visitati),
     ric_prof_cc(Nuovo_S,[S|Visitati],Resto,Depth1,Limit).

iterative_deepening(S,Visitati,[Az|Resto],Limit) :-  ric_prof_cc(S,Visitati,[Az|Resto],1,Limit).
iterative_deepening(S,Visitati,[Az|Resto],Limit) :-  NewLimit is Limit+1, write_ln(NewLimit), iterative_deepening(S,Visitati,[Az|Resto],NewLimit).
=======
ric_prof_cc_lim(S,_,_,[]) :- finale(S),!.
ric_prof_cc_lim(S,D,Visitati,[Az|Resto]) :-
    D>0,
    applicabile(Az,S),
    trasforma(Az,S,Nuovo_S),
    \+ member(Nuovo_S,Visitati),
    D1 is D-1,
    ric_prof_cc_lim(Nuovo_S,D1,[S|Visitati],Resto).
>>>>>>> 96693655b75b92e3c2003aeed2f6be3896d367d4:Prolog/esercizi_svolti/1-iterative_deepening.pl

ric_prof_cc_id(I,D,Ris) :- ric_prof_cc_lim(I,D,[],Ris).
ric_prof_cc_id(I,D,Ris) :-
    D1 is D+1,
    ric_prof_cc_id(I,D1,Ris).

prof_lim(D) :- iniziale(I),ric_prof_cc_lim(I,D,[],Ris),write(Ris).
prof_id :- iniziale(I),ric_prof_cc_id(I,1,Ris),write(Ris).
