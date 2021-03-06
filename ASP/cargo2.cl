%I programmi incrementali possono essere suddivisi in 3 parti.
% - La parte base per le informazioni che persistono (che sono mantenute) in tutti gli step.
% - La parte cumulative, dove devono essere impostate le regole cumulative che persistono 
%(che sono mantenute) in tutti gli step, ma dipendono dal parametro incrementale.
% - La parte volatile, dove devono esserci le query al programma, che devono contenere solo 
%l'ultimo stato

%DOMINIO
aereo(p1;p2).
merci(c1;c2;c3).
aeroporto(jfk;sfo;lax).

% STATO INIZIALE
init(posizione(c1,sfo)).
init(posizione(c2,jfk)).
init(posizione(c3,lax)).
init(posizione(p1,sfo)).
init(posizione(p2,jfk)).

% STATO FINALE
goal(posizione(c1,jfk)).
goal(posizione(c2,lax)).
goal(posizione(c3,sfo)).

% -------  Inizio della parte base  --------
#base.

holds(F,0) :- init(F).

% -------  Inizio della parte cumulative  --------
#cumulative s.

0 { carica(C,P,A,s) : merci(C) : aereo(P) : aeroporto(A) }.
0 { scarica(C,P,A,s) : merci(C) : aereo(P) : aeroporto(A) }.
0 { vola(P,DA,A,s) : aereo(P) : aeroporto(DA) : aeroporto(A) : DA!=A }.

% PRECONDIZIONI
% Azione Carica
:- carica(C,P,A,s), not holds(posizione(C,A), s-1).
:- carica(C,P,A,s), not holds(posizione(P,A), s-1).
:- carica(C,P,A,s), holds(in(C,_), s-1).
:- carica(C,P,A,s), holds(in(_,P), s-1).
:- carica(C,P1,_,s), carica(C,P2,_,s), P1!=P2.

% Azione Scarica
:- scarica(C,P,A,s), not holds(in(C,P), s-1).
:- scarica(C,P,A,s), not holds(posizione(P,A), s-1).

% Azione Vola
:- vola(P,DA,A,s), not holds(posizione(P,DA), s-1).
:- vola(P,_,A1,s), vola(P,_,A2,s), A1!=A2.

% EFFETTI
holds(in(C,P),s) :- carica(C,P,A,s).
-holds(posizione(C,A),s):- carica(C,P,A,s).

holds(posizione(C,A),s) :- merci(C), scarica(C,P,A,s).
-holds(in(C,P),s) :- merci(C), scarica(C,P,A,s).

holds(posizione(P,A),s) :- vola(P,DA,A,s).
-holds(posizione(P,DA),s) :- vola(P,DA,A,s).

holds(F,s) :- holds(F,s-1), not -holds(F,s).
-holds(F,s) :- -holds(F,s-1), not holds(F,s).

:- vola(P1,_,_,s), carica(_,P2,_,s), P1==P2.
:- vola(P1,_,_,s), scarica(_,P2,_,s), P1==P2.
:- carica(_,P1,_,s), scarica(_,P2,_,s), P1==P2.

% -------  Inizio della parte volatile  --------
#volatile s.

:- goal(F), not holds(F,s).

#minimize {vola(_,_,_,_) @ 1}.
#minimize {carica(_,_,_,_) @ 2}.
#minimize {scarica(_,_,_,_) @ 3}.

#base.
#hide.
#show vola/4.
#show carica/4.
#show scarica/4.
