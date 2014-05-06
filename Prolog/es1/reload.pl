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

% ================================================
% =================================================

ric_amp([nodo(S,LISTA_AZ)|_],_,LISTA_AZ):- finale(S).
ric_amp([nodo(S,LISTA_AZ)|RESTO],Visitati,SOL):-
	member(S,Visitati) ->
		ric_amp(RESTO,Visitati,SOL);
	espandi(nodo(S,LISTA_AZ),LISTA_SUCC),
	append(RESTO,LISTA_SUCC,CODA),
	ric_amp(CODA,[S|Visitati],SOL).

espandi(nodo(S,LISTA_AZ),LISTA_SUCC):-
%viene popolata la lista AZIONI tramite la findall
	findall(AZ,applicabile(AZ,S),AZIONI),
	successori(nodo(S,LISTA_AZ),AZIONI,LISTA_SUCC).
	
successori(_,[],[]).
successori(  nodo(S,LISTA_AZ),[AZ|RESTO], 
[nodo(NUOVO_S,NUOVA_LISTA_AZ)|ALTRI]  ):-
	trasforma(AZ,S,NUOVO_S),
	append(LISTA_AZ,[AZ],NUOVA_LISTA_AZ),
	successori(nodo(S,LISTA_AZ),RESTO,ALTRI).
	

ampiezza:- iniziale(S),
	ric_amp([nodo(S,[])],[],SOL), write(SOL).