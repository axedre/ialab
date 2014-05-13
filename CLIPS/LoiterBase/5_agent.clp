;;;;;   REGOLE MINIMALI PER IL FUNZIONAMENTO DELL'AGENTE
;;;;;   Ad ogni istante utente umano deve fornire indicazione sulla regola da eseguire tramite
;;;;;   apposita assert

(defmodule AGENT (import MAIN ?ALL) (export ?ALL))

(deftemplate kagent (slot time) (slot step) (slot pos-r) (slot pos-c)
    (slot direction)
)

(defrule  beginagent
    (declare (salience 10))
    (status (step 0))
    (not (exec (step 0)))
    (initial_agentstatus (pos-r ?r) (pos-c ?c) (direction ?d))
=>
    (assert (kagent (time 0) (step 0) (pos-r ?r) (pos-c ?c) (direction ?d)))
    (focus INIT_PUNTEGGI)
)

;; ***** NOSTRE MODIFICHE *****
(deftemplate dummy_target
    (slot pos-x)
    (slot pos-y)
)

(deftemplate temporary_target
    (slot pos-x)
    (slot pos-y)
)

(deftemplate nearest_gate
    (slot pos-x)
    (slot pos-y)
)

(deftemplate node (slot ident) (slot gcost) (slot fcost) (slot father) (slot pos-r)
    (slot pos-c) (slot direction) (slot open)
)

(deftemplate current (slot id))

(deftemplate newnode (slot ident) (slot gcost) (slot fcost) (slot father) (slot pos-r)
    (slot pos-c) (slot direction)
)

(deftemplate apply
    (slot id) (slot op) (slot direction) (slot pos-x) (slot pos-y)
)

;; anc = ancestor
(deftemplate exec-star
    (slot anc) (slot id) (slot op) (slot direction) (slot pos-x) (slot pos-y)
)

(deftemplate lastnode (slot id))

(deftemplate last (slot id))

(deftemplate last-direction (slot direction))

(deftemplate last-direction-astar
	(slot direction)
	(slot step)
)

;template temporaneo
(deftemplate visitata
    (slot pos-r)
    (slot pos-c)
)

(deftemplate costo-check
    (slot pos-r)
    (slot pos-c)
    (slot cost)
)

(deftemplate costo-check-astar
    (slot pos-r)
    (slot pos-c)
    (slot cost)
    (slot step)
)

;; ho incluso il type al solo scopo di debugging
(deftemplate score_cell
    (slot pos-r)
    (slot pos-c)
    (slot val)
    (slot abs_score)
    (slot rel_score)
    (slot abs_step)
    (slot type)
)

(deftemplate path
    (slot id)
    (slot oper)
    (slot target-r)
    (slot target-c)
)

(deftemplate path-star
    (slot id)
    (slot oper)
    (slot target-r)
    (slot target-c)
)

(deftemplate move-path
    (slot id)
    (slot oper)
)

(deftemplate inform-act
    (slot r)
    (slot c)
    (slot status)
    (slot id)
)

(deftemplate invalid-target
    (slot pos-r)
    (slot pos-c)
)

(deftemplate avoid-inform
    (slot pos-r)
    (slot pos-c)
)

(deffunction count-facts (?template)
    (bind ?count 0)
    (do-for-all-facts ((?fct ?template)) TRUE
        (bind ?count (+ ?count 1))
    )
    ?count
)

; Funzione che restituisce TRUE se è già stata eseguita una azione di tipo inform
; per la cella di coordinate ?r ?c
(deffunction informed (?r ?c)
    return (any-factp ((?e exec)) (and (eq ?e:action inform) (eq ?e:param1 ?r) (eq ?e:param2 ?c)))
)

;------------------ Fine delle nostre modifiche --------------------

(defrule exec_act
    (declare (salience 11))
    (status (step ?s))
    (exec (step ?s))
=>
    (focus MAIN)
)

(defrule move_act
        (declare (salience 9))
        (status (step ?s))
?f  <-  (move-path (oper ?oper) (id ?id))
        (not (move-path (id ?id2&:(< ?id2 ?id))))
    =>
        (assert (exec (step ?s) (action ?oper)))
        (retract ?f)
)

(defrule inform_act
        (declare (salience 10))
        (status (step ?s))
?f  <-  (inform-act (r ?r) (c ?c) (status ?status) (id ?id))
        (not (inform-act (id ?id2&:(< ?id2 ?id))))
    =>
        (assert (exec (step ?s) (action inform) (param1 ?r) (param2 ?c) (param3 ?status)))
        (retract ?f)
)

(defrule loiter_act
	(declare (salience 11))
	(status (step ?s))
?f  <-  (loiter-act)
    =>
	(assert (exec (step ?s) (action loiter-monitoring)))
	(retract ?f)
)

(defrule inform_loiter_act
	(declare (salience 11))
?f  <-	(perc-monitor (step ?s) (pos-r ?r) (pos-c ?c) (perc ?perc))
    =>
	(if (eq ?perc low-water) then
            (assert (exec (step ?s) (action inform) (param1 ?r) (param2 ?c) (param3 initial-flood)))
        else
            (assert (exec (step ?s) (action inform) (param1 ?r) (param2 ?c) (param3 severe-flood)))
        )
        (retract ?f)
)

(defrule done
    (declare (salience 0))
    (status (step ?s))
    (not (exec (step ?s)))
=>
    (assert (exec (action done) (step ?s)))
)

(defrule init
    (declare (salience 2))
    (status (step 0))
    (initial_agentstatus (pos-r ?r) (pos-c ?c) (direction ?d))
=>
    (switch ?d
        (case north then
            (assert (temporary_target (pos-x (+ ?r 1)) (pos-y ?c)))
            (assert (dummy_target (pos-x (+ ?r 1)) (pos-y ?c)))
        )
        (case west then
            (assert (temporary_target (pos-x ?r) (pos-y (- ?c 1))))
            (assert (dummy_target (pos-x ?r) (pos-y (- ?c 1))))
        )
        (case east then
            (assert (temporary_target (pos-x ?r) (pos-y (+ ?c 1))))
            (assert (dummy_target (pos-x ?r) (pos-y (+ ?c 1))))
        )
        (case south then
            (assert (temporary_target (pos-x (- ?r 1)) (pos-y ?c)))
            (assert (dummy_target (pos-x (- ?r 1)) (pos-y ?c)))
        )
    )
    (assert (move-path (oper go-forward) (id 0)))
    (printout t "--- Focus INIT_PUNTEGGI ---" crlf)
    (focus INIT_PUNTEGGI)
)

; 1) FINISH
(defrule control-finish
    (declare (salience 1))
    (not (finished))
    (not (finish_checked))
    =>
    (printout t "--- Focus FINISH ---" crlf)
    (focus FINISH)
)
; 2) PUNTEGGI
(defrule control-punteggi
    (declare (salience 1))
    (not (finished))
    (finish_checked)
    (not (punteggi_checked))
=>
    (printout t "--- Focus PUNTEGGI ---" crlf)
    (focus PUNTEGGI)
)
; 3) ASTAR
(defrule control-astar
    (declare (salience 1))
    (not (finished))
    (punteggi_checked)
    (not (astar_checked))
=>
    (printout t "--- Focus ASTAR ---" crlf)
    (focus ASTAR)
)
; 4) EXIT
(defrule control-exit
    (declare (salience 1))
    (not (finished))
    (astar_checked)
    (not (exit_checked))
=>
    (printout t "--- Focus EXIT ---" crlf)
    (focus EXIT)
)
; 5) TIME
(defrule control-time
    (declare (salience 1))
    (not (finished))
    (exit_checked)
    (not (time_checked))
    =>
    (printout t "--- Focus TIME ---" crlf)
    (focus TIME)
)
; 6) INFORM
(defrule control-inform
    (declare (salience 1))
    (or (finished) (time_checked))
    (not (inform_checked))
=>
    (printout t "--- Focus INFORM ---" crlf)
    (focus INFORM)
)
; 7) MOVE
(defrule control-move
    (declare (salience 1))
    (not (move_checked))
    (or (finished) (inform_checked))
=>
    (printout t "--- Focus MOVE ---" crlf)
    (focus MOVE)
)
; 8) CLEANUP
(defrule cleanup
    (declare (salience 1))
    ?f1 <- (finish_checked)
    ?f2 <- (punteggi_checked)
    ?f3 <- (astar_checked)
    ?f4 <- (exit_checked)
    ?f5 <- (time_checked)
    ?f6 <- (inform_checked)
    ?f7 <- (move_checked)
=>
    (printout t "--- CLEANUP ---" crlf)
    (retract ?f1 ?f2 ?f3 ?f4 ?f5 ?f6 ?f7)
    (do-for-all-facts ((?f avoid-inform)) TRUE
        (retract ?f)
    )
)
