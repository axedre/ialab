(defmodule EXIT (import AGENT ?ALL) (export ?ALL))

(defrule exit-clean1
		(declare (salience 110))
		(status (step ?s))
?f <-	(costo-check (cost ?g) (pos-r ?x) (pos-c ?y))
		(not (costo-check-astar (step ?s)))
	=>
		(assert (costo-check-astar (pos-r ?x) (pos-c ?y) (cost ?g) (step ?s)))
		(retract ?f)
)	

(defrule exit-clean2
		(declare (salience 110))
		(status (step ?s))
?f <-	(last-direction (direction ?dir))
		(not (last-direction-astar (step ?s)))
	=>
		(assert (last-direction-astar (direction ?dir) (step ?s)))
		(retract ?f)
)

(defrule exit-clean4
		(declare (salience 110))
		(not (exit-run))
		(status (step ?s))
?f <-	(exit-analizzato ?x1 ?y1 ?s)
	=>
		(retract ?f)
)

;Però non sappiamo in che direzione sarà l'UAV.
;Non possiamo inizializzare node con direction north
(defrule exit-go
		(declare (salience 100))
		(status (step ?s))
		;(perc-vision (step ?s) (pos-r ?r) (pos-c ?c))
		(prior_cell (pos-r ?x1) (pos-c ?y1) (type gate))
		(temporary_target (pos-x ?r) (pos-y ?c))
?f1 <-  (dummy_target)
		(last-direction-astar (direction ?dir) (step ?s))
		(not (exit-analizzato ?x1 ?y1 ?s))
		(not(exit-run))
	=>
		(retract ?f1)
		; (retract ?f2)
        (assert (dummy_target (pos-x ?x1) (pos-y ?y1)))
        (assert 
            (node 
                (ident 0) 
                (gcost 0) 
                (fcost (+ (* (+ (abs (- ?x1 ?r)) (abs (- ?y1 ?c))) 10) 5))
                (father NA) 
                (pos-r ?r) 
                (pos-c ?c)
                (direction ?dir) 
                (open yes)
            )
        )
    	(assert (current (id 0)))
    	(assert (lastnode (id 0)))
		(assert (exit-analizzato ?x1 ?y1 ?s))
		(assert (exit-run))
		(focus ASTAR-ALGORITHM)
)

(defrule exit-go-2
		(declare (salience 100))
		(status (step ?s))
		;(perc-vision (step ?s) (pos-r ?r) (pos-c ?c))
		(prior_cell (pos-r ?x1) (pos-c ?y1) (type gate))
		(temporary_target (pos-x ?r) (pos-y ?c))
?f1 <-  (dummy_target)
		(not(costo-check))
		(last-direction-astar (direction ?dir) (step ?s))
		(not (exit-analizzato ?x1 ?y1 ?s))
		(exit-run)
	=>
		(retract ?f1)
		; (retract ?f2)
        (assert (dummy_target (pos-x ?x1) (pos-y ?y1)))
        (assert 
            (node 
                (ident 0) 
                (gcost 0) 
                (fcost (+ (* (+ (abs (- ?x1 ?r)) (abs (- ?y1 ?c))) 10) 5))
                (father NA) 
                (pos-r ?r) 
                (pos-c ?c)
                (direction ?dir) 
                (open yes)
            )
        )
    	(assert (current (id 0)))
    	(assert (lastnode (id 0)))
		(assert (exit-analizzato ?x1 ?y1 ?s))
		(focus ASTAR-ALGORITHM)
)

(defrule exit-clean3
		(declare (salience 50))
?f <-	(path)
	=>
		(retract ?f)
)

(defrule exit-ok
		(declare (salience 0))
		(status (step ?s))
?f1 <-	(costo-check)
?f2	<-	(exit-run)
	(temporary_target (pos-x ?r1) (pos-y ?c1))
    =>
		(retract ?f1)
		(retract ?f2)
		(assert (exit_checked ?s))
		(pop-focus)
)

(defrule exit-invalid
		(declare (salience 1))
		(status (step ?s))
		(not (costo-check))
?f1 <- 	(punteggi_checked ?s)
?f2 <- 	(astar_checked ?s)
?f3	<-	(exit-run)
		(temporary_target (pos-x ?r) (pos-y ?c))
	=>
		(retract ?f1)
		(retract ?f2)
		(retract ?f3)
		(assert (invalid-target (pos-r ?r) (pos-c ?c)))
		(pop-focus)
)