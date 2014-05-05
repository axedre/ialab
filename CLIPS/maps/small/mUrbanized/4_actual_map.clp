(defrule creation1
	(declare (salience 25))
	?f1 <- (create-actual-map)
=>
	(assert
		(actual_cell (pos-r 11) (pos-c 1) (type border) (status ok))
		(actual_cell (pos-r 11) (pos-c 2) (type border) (status ok))
		(actual_cell (pos-r 11) (pos-c 3) (type border) (status ok))
		(actual_cell (pos-r 11) (pos-c 4) (type gate) (status ok))
		(actual_cell (pos-r 11) (pos-c 5) (type border) (status ok))
		(actual_cell (pos-r 11) (pos-c 6) (type border) (status ok))
		(actual_cell (pos-r 11) (pos-c 7) (type border) (status ok))
		(actual_cell (pos-r 11) (pos-c 8) (type border) (status ok))
		(actual_cell (pos-r 11) (pos-c 9) (type border) (status ok))
		(actual_cell (pos-r 11) (pos-c 10) (type border) (status ok))
		(actual_cell (pos-r 11) (pos-c 11) (type border) (status ok))
		(actual_cell (pos-r 10) (pos-c 1) (type border) (status ok))
		(actual_cell (pos-r 10) (pos-c 2) (type urban) (status initial-flood))
		(actual_cell (pos-r 10) (pos-c 3) (type urban) (status severe-flood))
		(actual_cell (pos-r 10) (pos-c 4) (type urban) (status initial-flood))
		(actual_cell (pos-r 10) (pos-c 5) (type rural) (status severe-flood))
		(actual_cell (pos-r 10) (pos-c 6) (type rural) (status ok))
		(actual_cell (pos-r 10) (pos-c 7) (type urban) (status severe-flood))
		(actual_cell (pos-r 10) (pos-c 8) (type urban) (status severe-flood))
		(actual_cell (pos-r 10) (pos-c 9) (type urban) (status initial-flood))
		(actual_cell (pos-r 10) (pos-c 10) (type urban) (status severe-flood))
		(actual_cell (pos-r 10) (pos-c 11) (type border) (status ok))
		(actual_cell (pos-r 9) (pos-c 1) (type border) (status ok))
		(actual_cell (pos-r 9) (pos-c 2) (type urban) (status ok))
		(actual_cell (pos-r 9) (pos-c 3) (type urban) (status ok))
		(actual_cell (pos-r 9) (pos-c 4) (type urban) (status initial-flood))
		(actual_cell (pos-r 9) (pos-c 5) (type hill) (status ok))
		(actual_cell (pos-r 9) (pos-c 6) (type hill) (status ok))
		(actual_cell (pos-r 9) (pos-c 7) (type lake) (status ok))
		(actual_cell (pos-r 9) (pos-c 8) (type urban) (status ok))
		(actual_cell (pos-r 9) (pos-c 9) (type urban) (status initial-flood))
		(actual_cell (pos-r 9) (pos-c 10) (type rural) (status initial-flood))
		(actual_cell (pos-r 9) (pos-c 11) (type border) (status ok))
		(actual_cell (pos-r 8) (pos-c 1) (type gate) (status ok))
		(actual_cell (pos-r 8) (pos-c 2) (type urban) (status ok))
		(actual_cell (pos-r 8) (pos-c 3) (type rural) (status initial-flood))
		(actual_cell (pos-r 8) (pos-c 4) (type rural) (status severe-flood))
		(actual_cell (pos-r 8) (pos-c 5) (type lake) (status ok))
		(actual_cell (pos-r 8) (pos-c 6) (type lake) (status ok))
		(actual_cell (pos-r 8) (pos-c 7) (type lake) (status ok))
		(actual_cell (pos-r 8) (pos-c 8) (type rural) (status ok))
		(actual_cell (pos-r 8) (pos-c 9) (type rural) (status initial-flood))
		(actual_cell (pos-r 8) (pos-c 10) (type rural) (status severe-flood))
		(actual_cell (pos-r 8) (pos-c 11) (type gate) (status ok))
		(actual_cell (pos-r 7) (pos-c 1) (type border) (status ok))
		(actual_cell (pos-r 7) (pos-c 2) (type rural) (status initial-flood))
		(actual_cell (pos-r 7) (pos-c 3) (type rural) (status ok))
		(actual_cell (pos-r 7) (pos-c 4) (type rural) (status initial-flood))
		(actual_cell (pos-r 7) (pos-c 5) (type urban) (status severe-flood))
		(actual_cell (pos-r 7) (pos-c 6) (type urban) (status severe-flood))
		(actual_cell (pos-r 7) (pos-c 7) (type hill) (status ok))
		(actual_cell (pos-r 7) (pos-c 8) (type hill) (status ok))
		(actual_cell (pos-r 7) (pos-c 9) (type hill) (status ok))
		(actual_cell (pos-r 7) (pos-c 10) (type rural) (status ok))
		(actual_cell (pos-r 7) (pos-c 11) (type border) (status ok))
		(actual_cell (pos-r 6) (pos-c 1) (type border) (status ok))
		(actual_cell (pos-r 6) (pos-c 2) (type hill) (status ok))
		(actual_cell (pos-r 6) (pos-c 3) (type hill) (status ok))
		(actual_cell (pos-r 6) (pos-c 4) (type rural) (status ok))
		(actual_cell (pos-r 6) (pos-c 5) (type urban) (status initial-flood))
		(actual_cell (pos-r 6) (pos-c 6) (type urban) (status severe-flood))
		(actual_cell (pos-r 6) (pos-c 7) (type urban) (status severe-flood))
		(actual_cell (pos-r 6) (pos-c 8) (type rural) (status ok))
		(actual_cell (pos-r 6) (pos-c 9) (type rural) (status ok))
		(actual_cell (pos-r 6) (pos-c 10) (type rural) (status ok))
		(actual_cell (pos-r 6) (pos-c 11) (type border) (status ok))
		(actual_cell (pos-r 5) (pos-c 1) (type border) (status ok))
		(actual_cell (pos-r 5) (pos-c 2) (type urban) (status severe-flood))
		(actual_cell (pos-r 5) (pos-c 3) (type rural) (status ok))
		(actual_cell (pos-r 5) (pos-c 4) (type rural) (status ok))
		(actual_cell (pos-r 5) (pos-c 5) (type urban) (status initial-flood))
		(actual_cell (pos-r 5) (pos-c 6) (type rural) (status initial-flood))
		(actual_cell (pos-r 5) (pos-c 7) (type rural) (status initial-flood))
		(actual_cell (pos-r 5) (pos-c 8) (type rural) (status ok))
		(actual_cell (pos-r 5) (pos-c 9) (type hill) (status ok))
		(actual_cell (pos-r 5) (pos-c 10) (type hill) (status ok))
		(actual_cell (pos-r 5) (pos-c 11) (type border) (status ok))
		(actual_cell (pos-r 4) (pos-c 1) (type border) (status ok))
		(actual_cell (pos-r 4) (pos-c 2) (type urban) (status severe-flood))
		(actual_cell (pos-r 4) (pos-c 3) (type rural) (status severe-flood))
		(actual_cell (pos-r 4) (pos-c 4) (type rural) (status severe-flood))
		(actual_cell (pos-r 4) (pos-c 5) (type hill) (status ok))
		(actual_cell (pos-r 4) (pos-c 6) (type rural) (status initial-flood))
		(actual_cell (pos-r 4) (pos-c 7) (type urban) (status severe-flood))
		(actual_cell (pos-r 4) (pos-c 8) (type urban) (status severe-flood))
		(actual_cell (pos-r 4) (pos-c 9) (type hill) (status ok))
		(actual_cell (pos-r 4) (pos-c 10) (type urban) (status initial-flood))
		(actual_cell (pos-r 4) (pos-c 11) (type gate) (status ok))
		(actual_cell (pos-r 3) (pos-c 1) (type border) (status ok))
		(actual_cell (pos-r 3) (pos-c 2) (type urban) (status severe-flood))
		(actual_cell (pos-r 3) (pos-c 3) (type urban) (status initial-flood))
		(actual_cell (pos-r 3) (pos-c 4) (type rural) (status initial-flood))
		(actual_cell (pos-r 3) (pos-c 5) (type rural) (status ok))
		(actual_cell (pos-r 3) (pos-c 6) (type urban) (status ok))
		(actual_cell (pos-r 3) (pos-c 7) (type urban) (status severe-flood))
		(actual_cell (pos-r 3) (pos-c 8) (type hill) (status ok))
		(actual_cell (pos-r 3) (pos-c 9) (type urban) (status severe-flood))
		(actual_cell (pos-r 3) (pos-c 10) (type urban) (status severe-flood))
		(actual_cell (pos-r 3) (pos-c 11) (type border) (status ok))
		(actual_cell (pos-r 2) (pos-c 1) (type border) (status ok))
		(actual_cell (pos-r 2) (pos-c 2) (type urban) (status ok))
		(actual_cell (pos-r 2) (pos-c 3) (type urban) (status ok))
		(actual_cell (pos-r 2) (pos-c 4) (type lake) (status ok))
		(actual_cell (pos-r 2) (pos-c 5) (type lake) (status ok))
		(actual_cell (pos-r 2) (pos-c 6) (type urban) (status initial-flood))
		(actual_cell (pos-r 2) (pos-c 7) (type urban) (status severe-flood))
		(actual_cell (pos-r 2) (pos-c 8) (type urban) (status ok))
		(actual_cell (pos-r 2) (pos-c 9) (type urban) (status initial-flood))
		(actual_cell (pos-r 2) (pos-c 10) (type urban) (status ok))
		(actual_cell (pos-r 2) (pos-c 11) (type border) (status ok))
		(actual_cell (pos-r 1) (pos-c 1) (type border) (status ok))
		(actual_cell (pos-r 1) (pos-c 2) (type border) (status ok))
		(actual_cell (pos-r 1) (pos-c 3) (type border) (status ok))
		(actual_cell (pos-r 1) (pos-c 4) (type border) (status ok))
		(actual_cell (pos-r 1) (pos-c 5) (type gate) (status ok))
		(actual_cell (pos-r 1) (pos-c 6) (type border) (status ok))
		(actual_cell (pos-r 1) (pos-c 7) (type border) (status ok))
		(actual_cell (pos-r 1) (pos-c 8) (type border) (status ok))
		(actual_cell (pos-r 1) (pos-c 9) (type border) (status ok))
		(actual_cell (pos-r 1) (pos-c 10) (type border) (status ok))
		(actual_cell (pos-r 1) (pos-c 11) (type border) (status ok))
	)
	(retract ?f1)
)