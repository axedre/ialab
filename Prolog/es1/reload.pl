
% Dominio dei cammini su mappa 10x10

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

applicabile(nord,pos(R,C)) :- 
	R>1,
	R1 is R-1,
	\+ occupata(pos(R1,C)).

trasforma(est,pos(R,C),pos(R,C1)) :- C1 is C+1.
trasforma(ovest,pos(R,C),pos(R,C1)) :- C1 is C-1.
trasforma(sud,pos(R,C),pos(R1,C)) :- R1 is R+1.
trasforma(nord,pos(R,C),pos(R1,C)) :- R1 is R-1.

%Euristiche per il dominio dei cammini

dist_manhattan(pos(X1,Y1), pos(X2,Y2), Dist) :-
	X is X1 - X2,
	Y is Y1 - Y2,
	abs(X, Xabs),
	abs(Y, Yabs),
	Dist is Xabs + Yabs.
	
h(N,DIST) :- finale(S), dist_manhattan(N,S,DIST).
g(G,NUOVA_G) :- NUOVA_G is G + 1.

eur_start :- iniziale(I), goal(F), dist_manhattan(I, F, X), writeln(X).

% ricerca in profondità limitata
ric_prof_lim(S,_,[],F,_,D) :- F =< D, finale(S), !.
ric_prof_lim(S,Visitati,[Az|Resto],F,G,D) :-
     F =< D,
     applicabile(Az,S),
     trasforma(Az,S,Nuovo_S),
     \+ member(Nuovo_S,Visitati),
     g(G,Nuova_G), h(Nuovo_S,Nuova_H), Nuova_F is Nuova_G + Nuova_H,
     ric_prof_lim(Nuovo_S,[S|Visitati],Resto,Nuova_F,Nuova_G,D).
ric_prof_lim(_,_,_,F,_,D) :-
     F > D,
     aggiorna_prof(F),
     fail.

aggiorna_prof(F) :-
    f_minima(Bound),
    Bound =< F, !
    ;
    retract(f_minima(Bound)), !,
    asserta(f_minima(F)).

:- dynamic(f_minima/1).
f_minima(99999).

% ricerca idastar
ric_idastar(I,Ris,F,G,D) :- ric_prof_lim(I,[],Ris,F,G,D).
ric_idastar(I,Ris,F,G,_) :-
     f_minima(Nuova_D),
     retract(f_minima(Nuova_D)),
     asserta(f_minima(99999)),
     ric_idastar(I,Ris,F,G,Nuova_D).

% chiamata
idastar :- iniziale(S),
    h(S,H), G is 0, F is G + H,
    ric_idastar(S,SOL,F,G,F), write(SOL).