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