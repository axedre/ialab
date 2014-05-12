% DOMINIO
#const lastlev=1.
aereo(p1;p2).
merci(c1;c2).
aereoporto(jfk;sfo).
livello(0..lastlev).
stato(0..lastlev+1).

% AZIONI
1 {
    carica(C,P,A,S) : merci(C) : aereo(P) : aereoporto(A),
    scarica(C,P,A,S)  : merci(C) : aereo(P) : aereoporto(A),
    vola(P,D,A,S) : aereo(P) : aereoporto(D) : aereoporto(A)
} :- livello(S).

% EFFETTI
% Se allo stato S carichiamo il cargo C sull’aereo P che si trova all’aereoporto A, allo stato S+1 la posizione del cargo C non sarà più l’aereoporto A
-posizione(C,A,S+1) :- carica(C,P,A,S), stato(S).
% Se allo stato S carichiamo il cargo C sull’aereo P che si trova all’aereoporto A, allo stato S+1 il cargo C sarà sull’aereo P
in(C,P,S+1) :- carica(C,P,A,S), stato(S).

% Se allo stato S scarichiamo il cargo C dall’aereo P che si trova all’aereoporto A, allo stato S+1 la posizione del cargo C sarà l’aereoporto A
posizione(C,A,S+1) :- scarica(C,P,A,S), stato(S).
% Se allo stato S scarichiamo il cargo C dall’aereo P che si trova all’aereoporto A, allo stato S+1 la posizione del cargo C non sarà più l’aereo P
-in(C,P,S+1) :- scarica(C,P,A,S), stato(S).

% Se allo stato S l’aereo P vola dall’aereoporto D all’aereoporto A, l’aereo P non si troverà all’aereoporto D allo stato S+1
-posizione(P,D,S+1) :- vola(P,D,A,S), stato(S).
% Se allo stato S l’aereo P vola dall’aereoporto D all’aereoporto A, l’aereo P si troverà all’aereoporto A allo stato S+1
posizione(P,A,S+1) :- vola(P,D,A,S), stato(S).

% PRECONDIZIONI
:- carica(C,P,A,S), not posizione(C,A,S).
:- carica(C,P,A,S), not posizione(P,A,S).
:- scarica(C,P,A,S), not in(C,P,S).
:- scarica(C,P,A,S), not posizione(P,A,S).
:- vola(P,D,A,S), vola(P,D,A,S+1).

% PERSISTENZA
%posizione(X,A,S+1) :- posizione(X,A,S), stato(S), not -posizione(X,A,S+1).
%-posizione(X,A,S+1) :- -posizione(X,A,S), stato(S), not posizione(X,A,S+1).
%vola(P,D,A,S+1) :- -vola(P,D,A,S), stato(S), not vola(P,D,A,S+1).
%-vola(P,D,A,S+1) :- vola(P,D,A,S), stato(S), not -vola(P,D,A,S+1).

% STATO INIZIALE
posizione(c1,sfo,0).
posizione(c2,jfk,0).
posizione(p1,sfo,0).
posizione(p2,jfk,0).

% STATO FINALE
goal :- posizione(c1,jfk,lastlev+1), posizione(c2,sfo,lastlev+1).
:- not goal.

#hide.
#show carica/4.
#show vola/4.
#show scarica/4.
