(defmodule PUNTEGGI (import AGENT ?ALL) (export ?ALL))

(defrule update_rel_score_current_cell
    (declare (salience 3))
    (status (step ?s))
    (perc-vision (step ?s) (pos-r ?r) (pos-c ?c))
    ?cella <- (score_cell (pos-r ?r) (pos-c ?c) (abs_step ?as&:(neq ?as ?s)))
    (not (invalid-target (pos-r ?r) (pos-c ?c)))
    =>
    ;; ASSEGNO UN PUNTEGGIO MOLTO BASSO ALLA CELLA SU CUI SONO
    (modify ?cella
        (val -1000)
        (abs_step ?s)
    )
)

;; contrassegno con un val di -1000 le celle segnalate come invalide, nel caso non sia già stato fatto
(defrule invalid_target
        (declare (salience 2))
        (invalid-target (pos-r ?r) (pos-c ?c))
?f <-   (score_cell (pos-r ?r) (pos-c ?c) (val ?val&:(neq ?val -1000)))
    =>
        (retract ?f)
        (assert (score_cell (pos-r ?r) (pos-c ?c) (val -1000)))
)

(defrule best-cell
	(declare (salience 2))
?f <-	(temporary_target (pos-x ?r1) (pos-y ?c1))
	(score_cell (pos-r ?r1) (pos-c ?c1) (val ?v&:(neq ?v nil)))
	(score_cell (pos-r ?r2) (pos-c ?c2) (val ?best&:(neq ?best nil)))
	(test (< ?v ?best))	
    =>
	(retract ?f)
	(assert (temporary_target (pos-x ?r2) (pos-y ?c2)))
	(printout t "Best Cell: ("?r2", "?c2") - Val: "?best" " crlf)
)

(defrule punteggi-ok
    (declare (salience 0))
    (status (step ?s))
    =>
    (printout t "Concluso aggiornamento punteggi turno " ?s crlf)
    (assert (punteggi_checked ?s))
)