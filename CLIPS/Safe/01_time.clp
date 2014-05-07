(defmodule TIME (import AGENT ?ALL) (export ?ALL))

(defrule time-clean1
		(declare (salience 150))
?f <-	(last-direction)
	=>
		(retract ?f)
)

(defrule time-clean2
		(declare (salience 150))
?f <-	(lastnode)
	=>
		(retract ?f)
)

(defrule time-clean3
		(declare (salience 150))
		(not (costo-check))
?f <-	(best-exit)
	=>
		(retract ?f)
)

; (defrule stop-loiter
		; (declare (salience 150))
		; (status (step ?s) (time ?t))
		; (maxduration ?m)
		; (test 
			; (>
				; ?t
				; ( * 
					; (/ ?t (count-facts score_cell))
					; 50
				; )
			; )
		; )
	; =>
		; (assert (stop-loiter))
; )

;; Eseguo questa regola per ogni gate. Intendo valutare il costo di
;; raggiungimento dello stesso a partire dalla posizione attuale
;; PROBLEMA: calcola il percorso solo per il primo gate che matcha
(defrule astar-find-exit
    (declare (salience 100))
    (prior_cell (pos-r ?x) (pos-c ?y) (type gate))
    (status (step ?s))
	(last-direction-astar (direction ?dir) (step ?s))
	(temporary_target (pos-x ?r) (pos-y ?c))
    (not (costo-check (pos-r ?x) (pos-c ?y)))
	(not (analizzato ?x ?y ?s))
	(not (hurry))

?f1 <- (dummy_target)
    =>

	(printout t "Time da ("?r","?c") per ("?x","?y")" crlf)

    (retract ?f1)

	(assert (analizzato ?x ?y ?s))

    (assert (dummy_target (pos-x ?x) (pos-y ?y)))
    (assert
        (node
            (ident 0)
            (gcost 0)
            (fcost (+ (* (+ (abs (- ?x ?r)) (abs (- ?y ?c))) 10) 5))
            (father NA)
            (pos-r ?r)
            (pos-c ?c)
            (direction ?dir)
            (open yes)
        )
    )
    (assert (current (id 0)))
    (assert (lastnode (id 0)))
    (focus ASTAR-ALGORITHM)
)

;; Asserisco un fatto best-exit con le coordinate dell'uscita più conveniente
(defrule check-exit-cost1
		(declare (salience 50))
		(not (best-exit ?a ?b ?c))
		(prior_cell (pos-r ?x) (pos-c ?y) (type gate))
		(costo-check (cost ?g))
		(costo-check (pos-r ?x) (pos-c ?y) (cost ?cost))
		(test (< ?cost ?g))
	=>
		(assert (best-exit ?x ?y ?cost))
)

(defrule check-exit-cost2
		(declare (salience 50))
?f <-	(best-exit ?x1 ?y1 ?cost)
		(costo-check (pos-r ?x1) (pos-c ?y1) (cost ?cost))
		(costo-check (pos-r ?x2) (pos-c ?y2) (cost ?best))
		(test (< ?best ?cost))
   =>
		(retract ?f)
		(assert (best-exit ?x2 ?y2 ?best))
)

(defrule check-exit-cost3
		(declare (salience 50))
		(not (best-exit ?a ?b ?c))
		(prior_cell (pos-r ?x) (pos-c ?y) (type gate))
		(costo-check (pos-r ?r1) (pos-c ?c1) (cost ?cost))
		(not (costo-check (pos-r ?r2&:(neq ?r2 ?r1)) (pos-c ?c2&:(neq ?c2 ?c1))))
	=>
		(assert (best-exit ?x ?y ?cost))
)

(defrule not-in-time
		(declare (salience 20))
		(best-exit ?x ?y ?cost)
		(status (step ?s) (time ?t))
		(costo-check-astar (cost ?g)(step ?s))
		(maxduration ?m)
		(test (> 
				(+ ?g ?cost) 
				(- ?m ?t)
				)
		)
?f <-	(dummy_target)
		(not (hurry))
=>
	   (printout t "ATTENZIONE: tempo insufficiente" crlf)
	   (printout t "Tempo: "?t" " crlf)

	   (retract ?f)
	   (assert (dummy_target (pos-x ?x) (pos-y ?y)))
	   (assert (hurry))
	   (focus PATH-TO-FINISH)
)

(defrule time-clean4
		(declare (salience 19))
		(not (hurry))
?f <-	(path)
	=>
		(retract ?f)
)

(defrule time-ok
		(declare (salience 15))
		(best-exit ?x ?y ?cost)
		(status (step ?s) (time ?t))
		(costo-check-astar (cost ?g)(step ?s))
		(maxduration ?m)
		(test (< (+ ?g ?cost)
				(- ?m ?t))
		)

		(not (time_checked ?s))

	=>
		(printout t "Tempo checked. Time: "?t crlf)
		(assert (time_checked ?s))
)

(defrule time-clean5
		(declare (salience 5))
?f <-	(costo-check)
	=>
		(retract ?f)
)

(defrule time-clean6
		(declare (salience 5))
?f <-	(last-direction)
	=>
		(retract ?f)
)