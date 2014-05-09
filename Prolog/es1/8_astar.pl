% ricerca A*
ric_astar([nodo(_,_,S,LISTA_AZ)|_],_,LISTA_AZ):- finale(S).
ric_astar([nodo(F,G,S,LISTA_AZ)|RESTO],CHIUSI,SOL):-
    member(S,CHIUSI) ->
        ric_astar(RESTO,CHIUSI,SOL);

        espandi(nodo(F,G,S,LISTA_AZ),LISTA_SUCC),
        ord_union(RESTO,LISTA_SUCC,CODA),
        ric_astar(CODA,[S|CHIUSI],SOL).

espandi(nodo(F,G,S,LISTA_AZ),LISTA_SUCC):-
    findall(AZ,applicabile(AZ,S),AZIONI),
    successori(nodo(F,G,S,LISTA_AZ),AZIONI,LISTA_SUCC).

successori(_,[],[]).
successori(nodo(F,G,S,LISTA_AZ),[AZ|RESTO],SUCCESSORI):-
    trasforma(AZ,S,NUOVO_S),
    append(LISTA_AZ,[AZ],NUOVA_LISTA_AZ),
    successori(nodo(F,G,S,LISTA_AZ),RESTO,ALTRI),
    g(G,NUOVA_G), h(NUOVO_S,NUOVA_H), NUOVA_F is NUOVA_G + NUOVA_H,
    ord_add_element(ALTRI,nodo(NUOVA_F,NUOVA_G,NUOVO_S,NUOVA_LISTA_AZ),SUCCESSORI).

astar :- iniziale(S),
    h(S,H), G is 0, F is G + H,
    ric_astar([nodo(F,G,S,[])],[],SOL), write(SOL).