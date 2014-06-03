% DOMINIO
#const s=1.
%aereo(p1;p2;p3).
aereo(p1;p2).
merci(c1;c2;c3).
aereoporto(jfk;sfo;lax).
stato(0..s). 

% AZIONI
1 {
    carica(C,P,A,S) : merci(C) : aereo(P) : aereoporto(A),
    scarica(C,P,A,S)  : merci(C) : aereo(P) : aereoporto(A),
    vola(P,D,A,S) : aereo(P) : aereoporto(D) : aereoporto(A)
} :- stato(S).

% EFFETTI

% Se allo stato S carichiamo il cargo C sull'aereo P che si trova all'aereoporto A, allo stato S+1 la posizione del cargo C non sarà più l'aereoporto A
-posizione(C,A,S+1) :- carica(C,P,A,S), stato(S).

% Se allo stato S carichiamo il cargo C sull'aereo P che si trova all'aereoporto A, allo stato S+1 il cargo C sarà sull'aereo P
in(C,P,S+1) :- carica(C,P,A,S), stato(S).

% Se allo stato S scarichiamo il cargo C dall'aereo P che si trova all'aereoporto A, allo stato S+1 la posizione del cargo C sarà l'aereoporto A
posizione(C,A,S+1) :- scarica(C,P,A,S), stato(S).

% Se allo stato S scarichiamo il cargo C dall'aereo P che si trova all'aereoporto A, allo stato S+1 la posizione del cargo C non sarà più l'aereo P
-in(C,P,S+1) :- scarica(C,P,A,S), stato(S).

% Se allo stato S l'aereo P vola dall'aereoporto D all'aereoporto A, l'aereo P non si troverà all'aereoporto D allo stato S+1
-posizione(P,D,S+1) :- vola(P,D,A,S), stato(S).

% Se allo stato S l'aereo P vola dall'aereoporto D all'aereoporto A, l'aereo P si troverà all'aereoporto A allo stato S+1
posizione(P,A,S+1) :- vola(P,D,A,S), stato(S).

% PRECONDIZIONI

% Per caricare la merce C sull'aereo P nell'aereoporto A allo stato S, C deve essere in A allo stato S.
:- carica(C,P,A,S), not posizione(C,A,S).

% Per caricare la merce C sull'aereo P nell'aereoporto A allo stato S, P deve essere in A allo stato S.
:- carica(C,P,A,S), not posizione(P,A,S).

% Per scaricare la merce C dall'aereo P nell'aereoporto A allo stato S, C deve essere in P allo stato S.
:- scarica(C,P,A,S), not in(C,P,S).

% Per scaricare la merce C dall'aereo P nell'aereoporto A allo stato S, P deve essere in A allo stato S.
:- scarica(C,P,A,S), not posizione(P,A,S).

% L'aereo P, per volare dall'aereoporto D all'aereoporto A allo stato S, deve trovarsi all'aereoporto D allo stato S.
:- vola(P,D,A,S), not posizione(P,D,S).

% Non posso caricare merce sull'aereo P e far volare P allo stesso stato
:- vola(P,_,_,S), carica(_,P,_,S).

% Non posso scaricare merce dall'aereo P e far volare P allo stesso stato
:- vola(P,_,_,S), scarica(_,P,_,S).

% Lo stesso aereo non può volare in due direzioni diverse allo stesso step
:- vola(P,_,A1,S), vola(P,_,A2,S), A1!=A2.

% PERSISTENZA

posizione(X,A,S+1) :- posizione(X,A,S), stato(S), not -posizione(X,A,S+1).
-posizione(X,A,S+1) :- -posizione(X,A,S), stato(S), not posizione(X,A,S+1).

in(C,P,S+1) :- in(C,P,S), stato(S), not -in(C,P,S+1).
-in(C,P,S+1) :- -in(C,P,S), stato(S), not in(C,P,S+1).

% STATO INIZIALE
posizione(c1,sfo,0).
posizione(c2,jfk,0).
posizione(c3,lax,0).
posizione(p1,sfo,0).
posizione(p2,jfk,0).
%posizione(p3,lax,0).

% STATO FINALE
goal :- posizione(c1,jfk,_), posizione(c2,lax,_), posizione(c3,sfo,_).
:- not goal.

#minimize {vola(_,_,_,_) @ 1}.
#minimize {carica(_,_,_,_) @ 2}.
#minimize {scarica(_,_,_,_) @ 3}.

#hide.
#show carica/4.
#show vola/4.
#show scarica/4.
