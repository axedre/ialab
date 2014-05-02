(defmodule PATH-TO-FINISH (import TIME ?ALL) (export ?ALL))

(defrule pathtofinish-clean1
		(declare (salience 90))
		(not (path-to-finish))
?f <-	(path)
	=>
		(retract ?f)
)

(defrule pathtofinish-clean2
		(declare (salience 90))
		(not (path-to-finish))
?f <-	(costo-check)
	=>
		(retract ?f)
)

(defrule pathtofinish-clean3
		(declare (salience 90))
		(not (path-to-finish))
?f <-	(best-exit ?x ?y ?z)
	=>
		(retract ?f)
)

(defrule pathtofinish-clean7
		(declare (salience 90))
		(not (path-to-finish))
		(status (step ?s))
?f <-	(analizzato ?x ?y ?s)
	=>
		(retract ?f)
)

(defrule pathtofinish-clean4
		(declare (salience 90))
?f <-	(lastnode)
	=>
		(retract ?f)
)

(defrule pathtofinish-clean5
		(declare (salience 90))
?f <-	(last-direction)
	=>
		(retract ?f)
)

(defrule pathtofinish-clean6
		(declare (salience 90))
?f <-	(path)
	=>
		(retract ?f)
)

(defrule pathtofinish
		(declare (salience 89))
	=>
		(assert (path-to-finish))
		(printout t "HURRYYYYYY!!!!")
)

;scegliere il percorso più breve per uscire oppure un qualunque percorso che stia nel tempo
(defrule best-exit
		(declare (salience 80))
		(status (step ?s))
		(perc-vision (step ?s) (direction ?dir) (pos-r ?r) (pos-c ?c))
		(prior_cell (pos-r ?x) (pos-c ?y) (type gate))
?f <- 	(dummy_target)
		(not (costo-check (pos-r ?x) (pos-c ?y)))
		(not (analizzato ?x ?y ?s))
		=>
		(retract ?f)
		(printout t "Uscita HURRY da ("?r","?c")" crlf)
		(printout t "Uscita HURRY per ("?x","?y")" crlf)
		(assert (dummy_target (pos-x ?x) (pos-y ?y)))
		(assert (analizzato ?x ?y ?s))
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

(defrule pathtofinish-clean8
		(declare (salience 40))
		(not (path-to-best-exit))
		(status (step ?s))
?f <-	(analizzato ?x ?y ?s)
	=>
		(retract ?f)
)

(defrule path-to-best-exit
		(declare (salience 30))
		(status (step ?s))
		(perc-vision (step ?s) (direction ?dir) (pos-r ?r) (pos-c ?c))
		(best-exit ?x ?y ?g)
?f <- 	(dummy_target)
		(not (analizzato ?x ?y ?s))
		=>
		
		(assert(path-to-best-exit))
		(assert(time_checked ?s))
		
		(retract ?f)
		(printout t "Azioni HURRY da ("?r","?c")" crlf)
		(printout t "Azioni HURRY per ("?x","?y")" crlf)
		(assert (dummy_target (pos-x ?x) (pos-y ?y)))
		(assert (analizzato ?x ?y ?s))
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