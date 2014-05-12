(defmodule POSTASTAR (import ASTAR-ALGORITHM ?ALL) (export ?ALL))

;regola per riordinare le azioni di movimento trovate da A*
;gira al contrario il percorso generato da A*
(defrule execute-exec-star
        (declare (salience 50))
?f1 <-  (last (id ?id))
        (node (ident ?id) (father ?anc&~NA))
        (dummy_target (pos-x ?x) (pos-y ?y))
?f2 <-  (exec-star (anc ?anc) (id ?id) (op ?oper) (direction ?dir) (pos-x ?r) (pos-y ?c))
        (prior_cell (pos-r ?r) (pos-c ?c) (type ?t))
        ;(not (double-check))
    =>
        ;(printout t " Eseguo azione " ?oper " da cella (" ?r "," ?c ") " crlf)
        ;(printout t " Eseguo azione " ?oper " da cella (" ?r "," ?c ") per arrivare al dummy target (" ?x "," ?y ")" crlf)
        ; Se non c'è ancora un fatto "astar_chacked" significa che sto eseguendo POSTASTAR per computare un percorso utile alla MOVE;
        ; di conseguenza, entro nel seguente if per marcare le celle di tipo urban sul mio percorso come da evitare
        (if (eq (count-facts astar_checked) 0) then
            (if (eq ?t urban) then
                (printout t "Evito la (" ?r "," ?c ")" crlf)
                (assert (avoid-inform (pos-r ?r) (pos-c ?c)))
            )
            (do-for-fact ((?cell prior_cell)) (and (eq ?cell:pos-r ?x) (eq ?cell:pos-c ?y) (eq ?cell:type urban))
                (printout t "Evito la (" ?x "," ?x ") (dummy_target)" crlf)
                (assert (avoid-inform (pos-r ?x) (pos-c ?y)))
            )
        )
        (assert (path (id ?id) (oper ?oper)))
        (assert (last (id ?anc)))
        (retract ?f1)
        (retract ?f2)
)

;regole per eliminare i fatti generati da A* non più utili
(defrule clean-astar1
        (declare (salience 25))
?f <-	(node)
        =>
	(retract ?f)
)

(defrule clean-astar2
        (declare (salience 25))
?f <-	(exec-star)
	=>
        (retract ?f)
)

(defrule clean-astar3
        (declare (salience 25))
?f <-	(last)
	=>
        (retract ?f)
)