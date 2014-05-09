% stato: [at(Stazione), Location]
% Location può essere in(NomeLinea, Dir) o
% 'ground' se l'agente non e' su nessun treno
% Dir può esere 0 o 1


% Azioni:
%  sali(Linea, Dir)
%  scendi(Stazione)
%  vai(Linea, Dir, StazionePartenza, StazioneArrivo)

applicabile(sali(Linea,Dir),[at(Stazione),ground]):-
	fermata(Stazione,Linea), member(Dir,[0,1]).
applicabile(scendi(Stazione),[at(Stazione),in(_,_)]).
applicabile(vai(Linea,Dir,SP,SA),[at(SP),in(Linea,Dir)]):-
	tratta(Linea,Dir,SP,SA).

trasforma(sali(Linea,Dir),[at(Stazione),ground],[at(Stazione),in(Linea,Dir)]).
trasforma(scendi(Stazione),[at(Stazione),in(_,_)],[at(Stazione),ground]).
trasforma(vai(Linea,Dir,SP,SA),[at(SP),in(Linea,Dir)],[at(SA),in(Linea,Dir)]):-
	tratta(Linea,Dir,SP,SA).
	
uguale(S,S).

% percorso(Linea, Dir, ListaFermate)

percorso(piccadilly,0,['Kings Cross','Holborn','Covent Garden',
	'Leicester Square','Piccadilly Circus','Green Park','South Kensington',
	'Gloucester Road','Earls Court']).
percorso(jubilee,0,['Baker Street','Bond Street','Green Park',   
	'Westminster','Waterloo','London Bridge']).
percorso(central,0,['Notting Hill Gate','Bond Street','Oxford Circus',
	'Tottenham Court Road','Holborn','Bank']).
percorso(victoria,0,['Kings Cross','Euston','Warren Street',
	'Oxford Circus','Green Park','Victoria']).
percorso(bakerloo,0,['Paddington','Baker Street','Oxford Circus',
	'Piccadilly Circus','Embankment','Waterloo']).
percorso(circle,0,['Embankment','Westminster','Victoria','South Kensington',
	'Gloucester Road','Notting Hill Gate','Bayswater','Paddington',
	'Baker Street','Kings Cross']).
	
percorso(Linea,1,LR):- percorso(Linea,0,L), reverse(L,LR).


% tratta(NomeLinea, Dir, StazionePartenza, StazioneArrivo)

tratta(Linea,Dir,SP,SA):- percorso(Linea,Dir,LF), member_pair(SP,SA,LF).

member_pair(X,Y,[X,Y|_]).
member_pair(X,Y,[_,Z|Rest]):- member_pair(X,Y,[Z|Rest]).


% stazione(Stazione, Coord1, Coord2)

stazione('Baker Street',4.5,5.6).
stazione('Bank',12,4).
stazione('Bayswater',1,3.7).
stazione('Bond Street',5.4,4.1).
stazione('Covent Garden',8,4).
stazione('Earls Court',0,0).
stazione('Embankment',8.2,3).
stazione('Euston',7.1,6.6).
stazione('Gloucester Road',1.6,0.6).
stazione('Green Park',6,2.8).
stazione('Holborn',8.6,4.8).
stazione('Kings Cross',8.2,7.1).
stazione('Leicester Square',7.6,3.6).
stazione('London Bridge',0,0).
stazione('Notting Hill Gate',0,3.2).
stazione('Oxford Circus',6.2,4.3).
stazione('Paddington',2.4,4.2).
stazione('Piccadilly Circus',7,3.3).
stazione('South Kensington',2.6,0.5).
stazione('Tottenham Court Road',7.4,4.5).
stazione('Victoria',5.8,1).
stazione('Warren Street',6.5,6).
stazione('Waterloo',9.2,2.4).
stazione('Westminster',8,1.8).


fermata(Stazione,Linea):- percorso(Linea,0,P), member(Stazione,P).


iniziale([at('Bayswater'),ground]).

finale([at('Covent Garden'),ground]).

dist_eucl([at(F1)|_], [at(F2)|_], Dist) :-
	stazione(F1,X1,Y1),
	stazione(F2,X2,Y2),
	Xdiff is X1 - X2,
	XExp is Xdiff * Xdiff,
	Ydiff is Y1 - Y2,
	YExp is Ydiff * Ydiff,
	Somm is XExp + YExp,
	Dist is sqrt(Somm),
	writeln(Dist).
	
h(N,DIST) :- finale(S), dist_eucl(N,S,DIST).
g(G,SP,SA,NUOVA_G) :-
	dist_eucl(SP,SA,Dist),
	Distanza is Dist,
	NUOVA_G is G + Distanza.

eur_start :- iniziale(I), finale(F), dist_eucl(I, F, X), writeln(X).

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
    g(G,S,NUOVO_S,NUOVA_G), h(NUOVO_S,NUOVA_H), NUOVA_F is NUOVA_G + NUOVA_H,
    ord_add_element(ALTRI,nodo(NUOVA_F,NUOVA_G,NUOVO_S,NUOVA_LISTA_AZ),SUCCESSORI).

astar :- iniziale(S),
    h(S,H), G is 0, F is G + H,
    ric_astar([nodo(F,G,S,[])],[],SOL), write(SOL).