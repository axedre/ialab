(defmodule FINISH (import AGENT ?ALL) (export ?ALL))

;; Controllo se ci sono ancora celle con uno score superiore a una certa soglia
;; (DA STABILIRE, PER IL MOMENTO E' MESSA A 0).
;; Ho una regola con una salience maggiore: se esistono celle con un punteggio
;; superiore alla soglia allora devo ancora fare delle inform su questa mappa,
;; eseguo, quindi, questa regola e rilascio il focus, asserendo (finish_checked),
;; mediante una (pop-focus).
;; Se non ci sono celle su cui debba ancora fare una inform allora non entro
;; nella prima regola, perciò, non avendo rilasciato il focus, entro nella regola
;; con salience minore. A questo punto asserisco semplicemente un fatto di tipo
;; (finished) che indica che posso dirigermi verso un'uscita.

(defrule informs-not-completed
        (declare (salience 10))
        (score_cell (rel_score ?rs&~nil))
        (test (> ?rs 0))
    =>
        (printout t "rel_score vale: " ?rs crlf)
        (assert (finish_checked))
        (pop-focus)
)

(defrule clean-finish1
        (declare (salience 6))
?f <-	(move-path)
    =>
        (retract ?f)
)

(defrule informs-completed
        (declare (salience 5))
    =>
	(printout t "INFORM COMPLETATE" crlf)
        (assert (finished))
        (focus PATH-TO-FINISH)
)