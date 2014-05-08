block(a).
block(b).
block(c).
block(d).
block(e).

iniziale(S):-
	list_to_ord_set([on(a,b),on(b,c),ontable(c),clear(a),on(d,e),
						  ontable(e),clear(d),handempty],S).

goal(G):- list_to_ord_set([on(a,b),on(b,c),on(c,d),ontable(d),
	ontable(e)],G).

% deve essere dimostrato goal(G). Siccome lo stato S prevede anche handempty allora G dev'essere un sottoinsieme di S (in quanto in G non è espresso l'elemento handempty).
finale(S):- goal(G), ord_subset(G,S).
