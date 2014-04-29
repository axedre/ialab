(defmodule MOVE (import AGENT ?ALL) (export ?ALL))

(defrule move
    (declare (salience 50))
    (status (step ?s))
    ?f1 <- (astar_checked ?s)
    ?f2 <- (exit_checked ?s)
    ?f3 <- (punteggi_checked ?s)
    ?f4 <- (time_checked ?s)
    ?f5 <- (path-star (id ?id) (oper ?oper))
    (not (path-star (id ?id2&:(neq ?id ?id2)&:(< ?id2 ?id))))
=>
    (printout t "Move RHS" crlf)
    (printout t "Eseguo exec: "?id", azione: "?oper" " crlf)
    (assert (exec (action ?oper) (step ?s)))
    (focus INFORM)
    (retract ?f1 ?f2 ?f3 ?f4 ?f5)
)

; Regola che asserisce la fine di una sessione di move
(defrule move-ok
    (declare (salience 0))
    (status (step ?s))
=>
    (printout t "Move-ok RHS" crlf)
    (assert (move_checked ?s))
)