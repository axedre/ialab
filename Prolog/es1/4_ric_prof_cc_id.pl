
%Iterative Deepening

ric_prof_cc_id(I,L,Ris) :- ric_prof_cc_lim(I,L,[],Ris).
ric_prof_cc_id(I,L,Ris) :-
	L1 is L+1,
	writeln(L1),
	ric_prof_cc_id(I,L1,Ris).

prof_id :- iniziale(I),ric_prof_cc_id(I,1,Ris),write(Ris).
