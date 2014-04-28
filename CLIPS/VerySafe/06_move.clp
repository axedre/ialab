(defmodule MOVE (import AGENT ?ALL) (export ?ALL))

(defrule move
    (declare (salience 50))
    (status (step ?s))
    ?f1 <- (astar_checked ?s)
    ;?f2 <- (exit_checked ?s)
    ?f3 <- (punteggi_checked ?s)
    ?f4 <- (time_checked ?s)
    ;?f5 <- (path-star (id ?id) (oper ?oper))
    ;(not (path-star (id ?id2&:(neq ?id ?id2)&:(< ?id2 ?id))))
=>
    (printout t "Move RHS" crlf)
    ;(printout t "Eseguo exec: "?id", azione: "?oper" " crlf)
    ;(assert (exec (action ?oper) (step ?s)))
    ;(retract ?f1)
    ;;(retract ?f2)
    ;(retract ?f3)
    ;;(retract ?f4)
    ;;(retract ?f5)
    ;(retract ?f6)
)

; Regola che asserisce la fine di una sessione di move
(defrule move-ok
    (declare (salience 0))
    (status (step ?s))
=>
    (assert (move_checked ?s))
)