(defmodule PUNTEGGI (import AGENT ?ALL) (export ?ALL))

(defrule update_rel_score_current_cell
    (declare (salience 3))
    (status (step ?s))
    (perc-vision (step ?s) (pos-r ?r) (pos-c ?c))
    ?cella <- (score_cell (pos-r ?r) (pos-c ?c) (abs_step ?as&:(neq ?as ?s)))
    (not (invalid-target (pos-r ?r) (pos-c ?c)))
    =>
    ;; ASSEGNO UN PUNTEGGIO RELATIVO MOLTO BASSO ALLA CELLA SU CUI SONO
    (modify ?cella
        (abs_score -5)
        (abs_step ?s)
    )
)

;; contrassegno con un abs_score di -1000 le celle segnalate come invalide, nel caso non sia già stato fatto
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
    =>
	(retract ?f)
	(assert (temporary_target (pos-x ?r2) (pos-y ?c2)))
	(printout t "Best Cell: ("?r2", "?c2") - Abs Score: "?best" " crlf)
)

(defrule punteggi-ok
    (declare (salience 0))
    (temporary_target (pos-x ?r1) (pos-y ?c1))
=>
    (assert (punteggi_checked))
)
