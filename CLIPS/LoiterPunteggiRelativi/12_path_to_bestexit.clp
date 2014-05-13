(defmodule PATH-TO-BESTEXIT (import PATH-TO-FINISH ?ALL) (export ?ALL))

(defrule pathtofinish-clean8
		(declare (salience 40))
		(not (path-to-best-exit))
		(status (step ?s))
?f <-	(analizzato ?x ?y ?s)
	=>
		(retract ?f)
)

(defrule pathtofinish-clean9
		(declare (salience 40))
		(not (path-to-best-exit))
?f <-	(lastnode)
	=>
		(retract ?f)
)

(defrule pathtofinish-clean10
		(declare (salience 40))
		(not (path-to-best-exit))
?f <-	(last-direction)
	=>
		(retract ?f)
)

(defrule pathtofinish-clean11
		(declare (salience 40))
		(not (path-to-best-exit))
?f <-	(costo-check)
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
				(fcost (* (+ (abs (- ?x ?r)) (abs (- ?y ?c))) 10))
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