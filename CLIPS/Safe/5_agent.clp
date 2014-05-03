
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
)

(deftemplate invalid-target
    (slot pos-r)
    (slot pos-c)
)
;------------------ Fine delle nostre modifiche --------------------

;; COMMENTATO PER VEDERLO NELL'INTERFACCIA
;;(defrule ask_act
;; ?f <-   (status (step ?i))
;;    =>  (printout t crlf crlf)
;;        (printout t "action to be executed at step:" ?i)
;;        (printout t crlf crlf)
;;        (modify ?f (result no)))

(defrule exec_act
    (declare (salience 10))
    (status (step ?i))
    (exec (step ?i))
=>
    (focus MAIN)
)

(defrule exec-move-path
        (declare (salience 9))
        (status (step ?s))
?f  <-	(move-path (id ?id) (oper ?oper))
        (not (move-path (id ?id2&:(neq ?id ?id2)&:(< ?id2 ?id))))
    =>
        (assert (exec (step ?s) (action ?oper)))
        (retract ?f)
        (focus INFORM)
        ;(focus FINISH)
)

(defrule exec-inform
        (declare (salience 9))
        (status (step ?s))
?f  <-  (inform-act (r ?r) (c ?c) (status ?status))
    =>
        (assert (exec (step ?s) (action inform) (param1 ?r) (param2 ?c) (param3 ?status)))
        (retract ?f)
)

(defrule turno0
    (declare (salience 5))
    (status (step 0))
=>
    (assert (temporary_target (pos-x 2) (pos-y 5)))
    (assert (dummy_target (pos-x 2) (pos-y 5)))
    (assert (exec (action go-forward) (step 0)))
    (focus INIT_PUNTEGGI)
)

(defrule control-punteggi
	(declare (salience 1))
    (status (step ?s))
    (not (punteggi_checked ?s))
    (not (astar_checked ?s))
    (not (exit_checked ?s))
    (not (time_checked ?s))
    (not (move_checked ?s))
    (not (finished))
=>
    (printout t "--- Focus punteggi ---" crlf)
    (focus PUNTEGGI)
)

(defrule control-astar
	(declare (salience 1))
    (status (step ?s))
    (perc-vision (step ?s) (pos-r ?r) (pos-c ?c))
    (punteggi_checked ?s)
    (not (astar_checked ?s))
    (not (exit_checked ?s))
    (not (time_checked ?s))
    (not (move_checked ?s))
    (not (finished))
=>
    (printout t "--- Focus a* ---" crlf)
    (focus ASTAR)
)

(defrule control-exit
	(declare (salience 1))
    (status (step ?s))
    (punteggi_checked ?s)
    (astar_checked ?s)
    (not (exit_checked ?s))
    (not (time_checked ?s))
    (not (move_checked ?s))
    (not (finished))
=>
    (printout t "--- Focus exit ---" crlf)
    (focus EXIT)
)

(defrule control-time
	(declare (salience 1))
    (status (step ?s))
    (punteggi_checked ?s)
    (astar_checked ?s)
    (exit_checked ?s)
    (not (time_checked ?s))
    (not (move_checked ?s))
    (not (finished))
=>
    (printout t "--- Focus time ---" crlf)
    (focus TIME)
)

(defrule control-move
	(declare (salience 1))
    (status (step ?s))
    (punteggi_checked ?s)
    (astar_checked ?s)
    (exit_checked ?s)
    (time_checked ?s)
    (not (move_checked ?s))
    (not (finished))
=>
    (printout t "--- Focus move ---" crlf)
    (focus MOVE)
)

(defrule done
	(declare (salience 0))
	(status (step ?s))
	(not (exec (step ?s)))
	=>
	(assert (exec (action done) (step ?s)))
)