merci(c1).
merci(c2).
aereo(p1).
aereo(p2).
aeroporto(jfk).
aeroporto(sfo).

init(posizione(c1,sfo)).
init(posizione(c2,jfk)).
init(posizione(p1,sfo)).
init(posizione(p2,jfk)).

goal(posizione(c1,jfk)).
goal(posizione(c2,sfo)).

#base.
% Define
holds(F,0) :- init(F).

#cumulative t.
% Generate
0 { carica(C,P,A,t) : merci(C) : aereo(P) : aeroporto(A) } 1.
0 { scarica(C,P,A,t) : merci(C) : aereo(P) : aeroporto(A) } 1.
0 { vola(P,DA,A,t) : aereo(P) : aeroporto(DA) : aeroporto(A) : DA!=A } 1.

%parte delle precondizioni affinchè l'azione carica sia valida
%1) per caricare una merce in un aereo questi due devono essere nello stesso aeroporto
:-carica(C,P,A,t), holds(posizione(C,A1),t-1), holds(posizione(P,A2),t-1), A1 != A2.	%esculdo azioni di carica se merce e aereo sono in diversi aeroporti
:-carica(C,P,A,t), holds(posizione(C,A1),t-1), A != A1.		%escludo azioni di carica se la merce non si trova nell'aeroporto in cui dovrebbe essere caricata
:-carica(C,P,A,t), holds(posizione(P,A2),t-1), A != A2.		%escludo azioni di carica se l'aereo non si trova nell'aeroporto indicato
:-carica(C,P,A,t), holds(in(C,_),t-1).	%un oggetto caricato allo step t-1 non può essere ricaricato allo step t
:-carica(C,P,A,t), holds(in(_,P),t-1). %se all'istante precedente è stato caricato un qualunque oggetto sull'aereo e non ho ancora scaricato non posso caricare altr


%parte delle precondizioni affinchè l'azione scarica sia valida
:-scarica(C,P,A,t), not holds(in(C,P),t-1).	%se C non è in P allora non posso scaricare C da P
:-scarica(C,P,A,t), not holds(posizione(P,A),t-1).	%se l'aereo P non si trova nell'aeroporto A allora non posso scaricare la merce in A

%parte delle precondizioni affinchè l'azione vola sia valida
:-vola(P,DA,A,t), not holds(posizione(P,DA),t-1). %se l'aereo non è in DA allora non può partire da DA per arrivare in A

%define
holds(in(C,P),t) :- carica(C,P,A,t).
-holds(posizione(C,A),t):- carica(C,P,A,t).

holds(posizione(C,A),t) :- merci(C), scarica(C,P,A,t).
-holds(in(C,P),t) :- merci(C), scarica(C,P,A,t).

holds(posizione(P,A),t) :- vola(P,DA,A,t).
-holds(posizione(P,DA),t) :- vola(P,DA,A,t).

holds(F,t) :- holds(F,t-1), not -holds(F,t).
-holds(F,t) :- -holds(F,t-1), not holds(F,t).

%posso scegliere al più un'azione ogni istante
:- 2{scarica(_,_,_,t),carica(_,_,_,t),vola(_,_,_,t)}.

%
#volatile t.
% Test
:- goal(F), not holds(F,t).
%

#base.
#hide.
#show vola/4.
#show carica/4.
#show scarica/4.
