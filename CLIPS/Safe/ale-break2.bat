(focus AGENT)
; (set-break control-astar)
; (set-break control-exit)
; (set-break exec_act)
(set-break control-time)
(set-break control-move)

; (focus ASTAR)
; (set-break astar-go)
; (set-break astar-ok)
; (set-break astar-clean1)
; (set-break astar-clean2)

; (focus ASTAR-ALGORITHM)
; (set-break close-empty)
; (set-break post-astar)
; (set-break achieved-goal)
; (set-break update-achieved-goal)
; (set-break go-forward-apply-east)

; (focus POSTASTAR)
; (set-break execute-exec-star)
; (set-break go-forward-apply-south)
; (set-break go-forward-exec-south)

; (focus PUNTEGGI)
; (set-break best-cell)
; (set-break best-cell-clean)

(focus TIME)
; (set-break target-dir)
; (set-break time-clean2)
; (set-break costo-astar)
; (set-break check-exit-cost1)
; (set-break check-exit-cost2)
; (set-break time-ok)
; (set-break astar-find-exit)
; (set-break path-to-finish)
; (set-break time-clean6)
(set-break not-in-time)

(focus PATH-TO-FINISH)
; (set-break notintime)
; (set-break path-to-finish)
; (set-break best-exit)
; (set-break pathtofinish-clean5)
; (set-break pathtofinish-clean4)
; (set-break check-exit-cost1)
; (set-break check-exit-cost2)
(set-break control-bestexit)

; (focus EXIT)
; (set-break exit-ok)
; (set-break exit-clean1)
; (set-break exit-go)
; (set-break exit-clean2)

(focus MOVE)
(set-break move-path-star)
(set-break move-path)

(focus PATH-TO-BESTEXIT)
(set-break path-to-best-exit)
