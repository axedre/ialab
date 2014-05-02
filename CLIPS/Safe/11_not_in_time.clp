(defmodule PATH-TO-FINISH (import TIME ?ALL) (export ?ALL))

(defrule notintime-clean1
		(declare (salience 90))
		(not (not-in-time))
?f <-	(path)
	=>
		(retract ?f)
)

(defrule notintime-clean2
		(declare (salience 90))
		(not (not-in-time))
?f <-	(costo-check)
	=>
		(retract ?f)
)

(defrule notintime-clean2
		(declare (salience 90))
		(not (not-in-time))
?f <-	(best-exit ?x ?y ?z)
	=>
		(retract ?f)
)

(defrule notintime
		(declare (salience 89))
	=>
		(assert (not-in-time))
		(printout t "HURRYYYYYY!!!!")
)

;scegliere il percorso più breve per uscire oppure un qualunque percorso che stia nel tempo
(defrule best-exit
		(declare (salience 80))
		(status (step ?s))
		(perc-vision (step ?s) (direction ?dir) (pos-r ?r) (pos-c ?c))
		(prior_cell (pos-r ?x) (pos-c ?y) (type gate))
		=>

		(printout t "Uscita HURRY da ("?r","?c")" crlf)
		(printout t "Uscita HURRY per ("?x","?y")" crlf)
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