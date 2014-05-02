(defmodule MOVE (import AGENT ?ALL) (export ?ALL))

(defrule move
        (not (hurry))
        (status (step ?s))
?f1 <-	(path-star (id ?id) (oper ?oper))
        (not (path-star (id ?id2&:(neq ?id ?id2)&:(< ?id2 ?id))))
    =>
        (printout t "Eseguo exec: "?id", azione: "?oper" " crlf)
        (retract ?f1)
        (assert (move-path (id ?id) (oper ?oper)))
)