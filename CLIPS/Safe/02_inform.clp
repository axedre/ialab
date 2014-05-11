(defmodule INFORM (import AGENT ?ALL) (export ?ALL))

; Funzione che restituisce TRUE se è già stata eseguita una azione di tipo inform
; per la cella di coordinate ?r ?c
(deffunction informed (?r ?c)
    return (any-factp ((?e exec)) (and (= (str-compare ?e:action inform) 0) (= ?e:param1 ?r) (= ?e:param2 ?c)))
)

; Funzione che restituisce TRUE se la cella (prior_cell) di coordinate ?r ?c è
; interessante (ossia di tipo rural o urban) NB Se servisse altrove, fattorizzare in altro modulo
(deffunction interesting (?r ?c)
    return (any-factp ((?cell prior_cell)) (and (= ?cell:pos-r ?r) (= ?cell:pos-c ?c) (or (= (str-compare ?cell:type rural) 0) (= (str-compare ?cell:type urban) 0))))
)

; Funzione che:
; * esegue l'azione di inform sulla cella ?cell di coordinate ?r ?c
;   (se interessante e non già informata) allo step ?step
; * asserisce un fatto di tipo must-update-rel-score
(deffunction inform (?r ?c ?cell ?step)
    (if (and (not (informed ?r ?c)) (interesting ?r ?c)) then
        (if (= (str-compare ?cell water) 0) then
            ;(printout t "Asserisco flood in " ?r ", " ?c crlf)
            (assert (inform-act (r ?r) (c ?c) (status flood) (id 0)))
        else
            ;(printout t "Asserisco ok in " ?r ", " ?c crlf)
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
            (case 5 then (inform ?r ?c ?cell ?step))
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
