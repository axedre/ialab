(defmodule MOVE (import AGENT ?ALL) (export ?ALL))

(defrule move-path-star
        (declare (salience 1))
?f1 <-	(path-star (id ?id) (oper ?oper))
        (not (path-star (id ?id2&:(< ?id2 ?id))))
?f2 <-  (inform_checked)
    =>
        (assert (move-path (id ?id) (oper ?oper)))
        (retract ?f1 ?f2)
        (pop-focus)
)

; commento
(defrule move-path-hurry
        (declare (salience 1))
?f1 <-	(path (id ?id) (oper ?oper))
        (not (path (id ?id2&:(< ?id2 ?id))))
?f2 <-  (inform_checked)
    =>
        (assert (move-path (id ?id) (oper ?oper)))
        (retract ?f1 ?f2)
        (pop-focus)
)

(defrule move-ok
    (declare (salience 0))
    (status (step ?s))
=>
    (assert (move_checked))
)