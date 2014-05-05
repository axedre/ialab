(defmodule PUNTEGGI (import AGENT ?ALL) (export ?ALL))

;; contrassegno con un rel_score di -1000 le celle segnalate come invalide, nel caso non sia già stato fatto
(defrule invalid_target
        (declare (salience 2))
        (invalid-target (pos-r ?r) (pos-c ?c))
?f <-   (score_cell (pos-r ?r) (pos-c ?c) (abs_score ?abs_score&:(neq ?abs_score -1000)))
    =>
        (retract ?f)
        (assert (score_cell (pos-r ?r) (pos-c ?c) (abs_score -1000)))
)

(defrule best-cell
	(declare (salience 2))
?f <-	(temporary_target (pos-x ?r1) (pos-y ?c1))
	(score_cell (pos-r ?r1) (pos-c ?c1) (abs_score ?abs&:(neq ?abs nil)))
	(score_cell (pos-r ?r2) (pos-c ?c2) (abs_score ?best&:(neq ?best nil)))
	(test (< ?abs ?best))
	;(not (analizzata ?r2 ?c2))
    =>
	(retract ?f)
	(assert (temporary_target (pos-x ?r2) (pos-y ?c2)))
	(printout t "Best Cell: ("?r2", "?c2") - Rel Score: "?best" " crlf)
)

(defrule punteggi-ok
    (declare (salience 0))
    (status (step ?s))
    =>
    (printout t "Concluso aggiornamento punteggi turno " ?s crlf)
    (assert (punteggi_checked ?s))
)