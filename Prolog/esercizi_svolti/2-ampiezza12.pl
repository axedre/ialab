%ricerca in ampiezza su albero
ric_amp([nodo(S,LISTA_AZ)|_],LISTA_AZ) :- finale(S).
ric_amp([nodo(S,LISTA_AZ)|RESTO],SOL) :-
    %length(RESTO,LR), write(LR), nl,
    espandi(nodo(S,LISTA_AZ),LISTA_SUCC),
    append(RESTO,LISTA_SUCC,CODA),
    ric_amp(CODA,SOL).

%ricerca in ampiezza su grafo con lista stati chiusi
ric_ampL([nodo(S,LISTA_AZ)|_],_,LISTA_AZ) :- finale(S).
ric_ampL([nodo(S,LISTA_AZ)|RESTO],CHIUSI,SOL) :-
    member(S,CHIUSI) ->
        ric_ampL(RESTO,CHIUSI,SOL);
        espandi(nodo(S,LISTA_AZ),LISTA_SUCC),
        append(RESTO,LISTA_SUCC,CODA),
        ric_ampL(CODA,[S|CHIUSI],SOL).
              
%ricerca in ampiezza su grafo con asserzione stati chiusi
:- dynamic chiuso/1.   %serve per poter asserire fatti di tipo chiuso(S)
ric_ampS([nodo(S,LISTA_AZ)|_],LISTA_AZ) :- finale(S).
ric_ampS([nodo(S,LISTA_AZ)|RESTO],SOL) :-
    chiuso(S) ->
        ric_ampS(RESTO,SOL);

        assert(chiuso(S)),
        espandi(nodo(S,LISTA_AZ),LISTA_SUCC),
        append(RESTO,LISTA_SUCC,CODA),
        ric_ampS(CODA,SOL).

espandi(nodo(S,LISTA_AZ),LISTA_SUCC) :-
    findall(AZ,applicabile(AZ,S),AZIONI),
    successori(nodo(S,LISTA_AZ),AZIONI,LISTA_SUCC).
        
successori(_,[],[]).
successori(nodo(S,LISTA_AZ),[AZ|RESTO], [nodo(NUOVO_S,NUOVA_LISTA_AZ)|ALTRI]) :-
    trasforma(AZ,S,NUOVO_S),
    append(LISTA_AZ,[AZ],NUOVA_LISTA_AZ),
    successori(nodo(S,LISTA_AZ),RESTO,ALTRI).
        

ampiezza :-
    iniziale(S),
    ric_amp([nodo(S,[])],SOL),
    write(SOL).

ampiezzaL :-
    iniziale(S),
    ric_ampL([nodo(S,[])],[],SOL),
    write(SOL).
        
ampiezzaS :-
    iniziale(S),
    ric_ampS([nodo(S,[])],SOL),
    write(SOL),
    retractall(chiuso(_)).