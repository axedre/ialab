(focus AGENT)
(set-break control-astar)
(set-break control-exit)
(set-break control-time)
(set-break control-punteggi)
(set-break control-move)
(set-break exec_act)
(set-break exec-move-path)

(focus ASTAR)
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

(focus PUNTEGGI)
; (set-break best-cell)
; (set-break punteggi-ok)

(focus TIME)
; (set-break target-dir)
; (set-break time-clean2)
; (set-break costo-astar)
; (set-break astar-find-exit)
; (set-break not-in-time)
; (set-break check-exit-cost1)
; (set-break check-exit-cost2)
; (set-break time-ok)

(focus EXIT)
; (set-break exit-ok)
; (set-break exit-clean1)
; (set-break exit-go)
; (set-break exit-clean2)
(set-break exit-invalid)

(focus MOVE)
(set-break move)