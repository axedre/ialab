(defmodule NEW (import ASTAR ?ALL) (export ?ALL))
; Controllo se il newnode generato è: 
; - chiuso
; - se è aperto ma c'è un modo migliore per arrivarci 
; - se effettivamente una soluzione migliore rispetto a quelle trovate (e quindi asserisco un fatto di tipo node)
; - se non è mai stato esplorato prima d'ora (asserisco quindi un fatto di tipo node)

(defrule check-closed
		(declare (salience 50))
?f1 <-  (newnode (ident ?id) (pos-r ?r) (pos-c ?c) (direction ?dir))
		(node (ident ?old) (pos-r ?r) (pos-c ?c) (direction ?dir) (open no))
		;?f2 <-    (alreadyclosed ?a)
		=>
		;(assert (alreadyclosed (+ ?a 1)))
		(retract ?f1)
		;(retract ?f2)

		(pop-focus)
)

(defrule check-open-worse
		(declare (salience 50)) 
?f1 <-  (newnode (ident ?id) (pos-r ?r) (pos-c ?c) (direction ?dir) (gcost ?g) (father ?anc))
		(node (ident ?old) (pos-r ?r) (pos-c ?c) (direction ?dir) (gcost ?g-old) (open yes))
		(test (or (> ?g ?g-old) (= ?g-old ?g)))
		;?f2 <-    (open-worse ?a)
		=>
		;(assert (open-worse (+ ?a 1)))
		(retract ?f1)
		;(retract ?f2)
		(pop-focus)
)

(defrule check-open-better

		(declare (salience 50)) 
?f1 <-  (newnode (ident ?id) (pos-r ?r) (pos-c ?c) (direction ?dir) (gcost ?g) (fcost ?f) (father ?anc))
?f2 <-  (node (ident ?old) (pos-r ?r) (pos-c ?c) (direction ?dir) (gcost ?g-old) (open yes))
		(test (<  ?g ?g-old))
;?f3 <-  (open-better ?a)
		=> 
		(assert (node (ident ?id) (pos-r ?r) (pos-c ?c) (direction ?dir) (gcost ?g) (fcost ?f) (father ?anc) (open yes)) )
		;(assert (open-better (+ ?a 1)))
		;(retract ?f1 ?f2 ?f3)
		(retract ?f1 ?f2)
		(pop-focus)
)

(defrule add-open
		(declare (salience 49))
?f1 <-  (newnode (ident ?id) (pos-r ?r) (pos-c ?c) (direction ?dir) (gcost ?g) (fcost ?f)(father ?anc))
		;?f2 <-    (numberofnodes ?a)
		=>     
		(assert (node (ident ?id) (pos-r ?r) (pos-c ?c) (direction ?dir) (gcost ?g) (fcost ?f)(father ?anc) (open yes)))
		;(assert (numberofnodes (+ ?a 1)))
		;(retract ?f1 ?f2)
		(retract ?f1)
		
		(pop-focus)
)
