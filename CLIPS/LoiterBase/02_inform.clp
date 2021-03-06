(defmodule INFORM (import AGENT ?ALL) (export ?ALL))

; Funzione che restituisce TRUE se la cella (prior_cell) di coordinate ?r ?c è di tipo urban
(deffunction urban (?r ?c)
    return (any-factp ((?cell prior_cell)) (and (eq ?cell:pos-r ?r) (eq ?cell:pos-c ?c) (eq ?cell:type urban)))
)

; Funzione che restituisce TRUE se la cella (prior_cell) di coordinate ?r ?c è di tipo rural
(deffunction rural (?r ?c)
    return (any-factp ((?cell prior_cell)) (and (eq ?cell:pos-r ?r) (eq ?cell:pos-c ?c) (eq ?cell:type rural)))
)

; Funzione che restituisce TRUE se la cella (prior_cell) di coordinate ?r ?c è
; interessante (ossia di tipo rural o urban)
(deffunction interesting (?r ?c)
    return (or (rural ?r ?c) (urban ?r ?c))
)

; Funzione che restituisce TRUE se la cella di coordinate ?r ?c è da evitare
(deffunction avoid (?r ?c)
    return (any-factp ((?e avoid-inform)) (and (= ?e:pos-r ?r) (= ?e:pos-c ?c)))
)

; Funzione che:
; * esegue l'azione di inform sulla cella ?cell di coordinate ?r ?c
;   (se interessante, non già informata e non da evitare) allo step ?step
; * asserisce un fatto di tipo must-update-rel-score
(deffunction inform (?r ?c ?cell ?step)
    (if (and (interesting ?r ?c) (not (informed ?r ?c)) (not (avoid ?r ?c))) then
        (if (eq ?cell water) then
            ;(printout t "Asserisco flood in " ?r ", " ?c crlf)
            (assert (inform-act (r ?r) (c ?c) (status flood) (id 0)))
        else
            ;(printout t "Asserisco ok in " ?r ", " ?c crlf)
            (assert (inform-act (r ?r) (c ?c) (status ok) (id 0)))
        )
        (assert (must-update-val ?r ?c))
    )
)

; Funzione che:
; * esegue l'azione di inform sulla cella ?cell di coordinate ?r ?c
;   (se interessante e non già informata) allo step ?step
; * asserisce un fatto di tipo must-update-rel-score
(deffunction inform-5 (?r ?c ?cell ?step)
    (if (and (interesting ?r ?c) (not (informed ?r ?c))) then
        (if (eq ?cell water) then
            (if (urban ?r ?c) then
                (assert (loiter-act))
		(printout t "Sto asserendo loiter-act" crlf)
                ;(assert (inform-act (r ?r) (c ?c) (status flood) (id 0)))
            else
                (assert (inform-act (r ?r) (c ?c) (status flood) (id 0)))
            )
        else
            (assert (inform-act (r ?r) (c ?c) (status ok) (id 0)))
        )
        (assert (must-update-val ?r ?c))
    )
)

; Funzione che cicla le nove celle percepite dall'UAV in un dato momento, e su
; ciascuna invoca la funzione inform
(deffunction inspect (?r ?c ?step ?cells)
    (progn$ (?cell ?cells)
        (switch ?cell-index
            (case 1 then (inform (+ ?r 1) (- ?c 1) ?cell ?step))
            (case 2 then (inform (+ ?r 1) ?c ?cell ?step))
            (case 3 then (inform (+ ?r 1) (+ ?c 1) ?cell ?step))
            (case 4 then (inform ?r (- ?c 1) ?cell ?step))
            (case 5 then (inform-5 ?r ?c ?cell ?step))
            (case 6 then (inform ?r (+ ?c 1) ?cell ?step))
            (case 7 then (inform (- ?r 1) (- ?c 1) ?cell ?step))
            (case 8 then (inform (- ?r 1) ?c ?cell ?step))
            (case 9 then (inform (- ?r 1) (+ ?c 1) ?cell ?step))
        )
    )
)

; Regola per inizializzare il contatore delle inform-act
(defrule init-id-cnt
    (declare (salience 100))
    (not (id-cnt ?c))
=>
    (assert (id-cnt 0))
)

; Regola per ispezionare celle mentre ci si sposta in direzione nord
(defrule inspect-north
    (declare (salience 50))
    (status (step ?step))
    (perc-vision
        (step ?step) (pos-r ?r) (pos-c ?c) (direction north)
        ; percezioni delle celle circostanti
        (perc1 ?nw)
        (perc2 ?n)
        (perc3 ?ne)
        (perc4 ?w)
        (perc5 ?cella)
        (perc6 ?e)
        (perc7 ?sw)
        (perc8 ?s)
        (perc9 ?se)
    )
=>
    (inspect ?r ?c ?step (create$ ?nw ?n ?ne ?w ?cella ?e ?sw ?s ?se))
)

; Regola per ispezionare celle mentre ci si sposta in direzione est
(defrule inspect-east
    (declare (salience 50))
    (status (step ?step))
    (perc-vision
        (step ?step) (pos-r ?r) (pos-c ?c) (direction east)
        ; percezioni delle celle circostanti
        (perc1 ?ne)
        (perc2 ?e)
        (perc3 ?se)
        (perc4 ?n)
        (perc5 ?cella)
        (perc6 ?s)
        (perc7 ?nw)
        (perc8 ?w)
        (perc9 ?sw)
    )
=>
    (inspect ?r ?c ?step (create$ ?nw ?n ?ne ?w ?cella ?e ?sw ?s ?se))
)

; Regola per ispezionare celle mentre ci si sposta in direzione sud
(defrule inspect-south
    (declare (salience 50))
    (status (step ?step))
    (perc-vision
        (step ?step) (pos-r ?r) (pos-c ?c) (direction south)
        ; percezioni delle celle circostanti
        (perc1 ?se)
        (perc2 ?s)
        (perc3 ?sw)
        (perc4 ?e)
        (perc5 ?cella)
        (perc6 ?w)
        (perc7 ?ne)
        (perc8 ?n)
        (perc9 ?nw)
    )
=>
    (inspect ?r ?c ?step (create$ ?nw ?n ?ne ?w ?cella ?e ?sw ?s ?se))
)

; Regola per ispezionare celle mentre ci si sposta in direzione ovest
(defrule inspect-west
    (declare (salience 50))
    (status (step ?step))
    (perc-vision
        (step ?step) (pos-r ?r) (pos-c ?c) (direction west)
        ; percezioni delle celle circostanti
        (perc1 ?sw)
        (perc2 ?w)
        (perc3 ?nw)
        (perc4 ?s)
        (perc5 ?cella)
        (perc6 ?n)
        (perc7 ?se)
        (perc8 ?e)
        (perc9 ?ne)
    )
=>
    (inspect ?r ?c ?step (create$ ?nw ?n ?ne ?w ?cella ?e ?sw ?s ?se))
)

; Regola che aggiorna il valore di una cella dopo la inform (di tipo normale):
; se è una cella di tipo urban il valore viene portato a -20, se è una cella di
; tipo rural il valore viene portato a -30.
(defrule update_val
    (declare (salience 2))
?f <- (must-update-val ?x ?y)
?g <- (score_cell (pos-r ?x) (pos-c ?y) (val ?v) (type ?type))
=>
    ;(printout t "Update_val eseguita per cella " ?x ", " ?y crlf)
    (retract ?f)
    (modify ?g (val -5))
    (loop-for-count (?i (- ?x 1) (+ ?x 1)) do
        (loop-for-count (?j (- ?y 1) (+ ?y 1)) do
            (assert (must-update-abs-score ?i ?j))
        )
    )
)

; Regola che aggiorna il punteggio assoluto di una cella quando cambiano il suo valore
; ed eventualmente quello delle celle circostanti a seguito di esecuzioni di update_val o update_full_val
(defrule update_abs_score
    (declare (salience 1))
?f <- (must-update-abs-score ?x ?y)
    (score_cell (pos-r =(+ ?x 1)) (pos-c =(- ?y 1)) (val ?nw))
    (score_cell (pos-r =(+ ?x 1)) (pos-c ?y) (val ?n))
    (score_cell (pos-r =(+ ?x 1)) (pos-c =(+ ?y 1)) (val ?ne))
    (score_cell (pos-r ?x) (pos-c =(- ?y 1)) (val ?w))
?cella <- (score_cell (pos-r ?x) (pos-c ?y) (val ?v) (type ?t&:(neq ?t hill)))
    (score_cell (pos-r ?x) (pos-c =(+ ?y 1)) (val ?e))
    (score_cell (pos-r =(- ?x 1)) (pos-c =(- ?y 1)) (val ?sw))
    (score_cell (pos-r =(- ?x 1)) (pos-c ?y) (val ?s))
    (score_cell (pos-r =(- ?x 1)) (pos-c =(+ ?y 1)) (val ?se))
=>
    (modify ?cella (abs_score (+ ?sw ?s ?se ?w ?v ?e ?nw ?n ?ne)))
    (retract ?f)
    ;(printout t "Update_abs_score eseguita per cella " ?x ", " ?y crlf)
)

(defrule fill-inform-act
        (declare (salience 1))
?f1 <-  (inform-act (id 0))
?f2 <-  (id-cnt ?c)
    =>
        (modify ?f1 (id (+ ?c 1)))
        (modify ?f2 (id-cnt (+ ?c 1)))
)

; Regola che asserisce la fine di una sessione di inform
(defrule inform-ok
        (declare (salience 0))
?f <-   (id-cnt ?c)
    =>
        (assert (inform_checked))
        (retract ?f)
        (pop-focus)
)
