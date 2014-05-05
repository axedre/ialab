(deffacts init (create)
	(maxduration 1000)
	(initial_agentstatus
		(pos-r 1) (pos-c 19)
		(direction north)
	)
)

(deffacts initialmap
	(prior_cell (pos-r 30) (pos-c 1) (type border))
	(prior_cell (pos-r 30) (pos-c 2) (type border))
	(prior_cell (pos-r 30) (pos-c 3) (type border))
	(prior_cell (pos-r 30) (pos-c 4) (type border))
	(prior_cell (pos-r 30) (pos-c 5) (type border))
	(prior_cell (pos-r 30) (pos-c 6) (type border))
	(prior_cell (pos-r 30) (pos-c 7) (type border))
	(prior_cell (pos-r 30) (pos-c 8) (type border))
	(prior_cell (pos-r 30) (pos-c 9) (type gate))
	(prior_cell (pos-r 30) (pos-c 10) (type border))
	(prior_cell (pos-r 30) (pos-c 11) (type border))
	(prior_cell (pos-r 30) (pos-c 12) (type border))
	(prior_cell (pos-r 30) (pos-c 13) (type border))
	(prior_cell (pos-r 30) (pos-c 14) (type border))
	(prior_cell (pos-r 30) (pos-c 15) (type border))
	(prior_cell (pos-r 30) (pos-c 16) (type border))
	(prior_cell (pos-r 30) (pos-c 17) (type border))
	(prior_cell (pos-r 30) (pos-c 18) (type border))
	(prior_cell (pos-r 30) (pos-c 19) (type border))
	(prior_cell (pos-r 30) (pos-c 20) (type border))
	(prior_cell (pos-r 30) (pos-c 21) (type border))
	(prior_cell (pos-r 29) (pos-c 1) (type border))
	(prior_cell (pos-r 29) (pos-c 2) (type hill))
	(prior_cell (pos-r 29) (pos-c 3) (type hill))
	(prior_cell (pos-r 29) (pos-c 4) (type hill))
	(prior_cell (pos-r 29) (pos-c 5) (type urban))
	(prior_cell (pos-r 29) (pos-c 6) (type urban))
	(prior_cell (pos-r 29) (pos-c 7) (type rural))
	(prior_cell (pos-r 29) (pos-c 8) (type rural))
	(prior_cell (pos-r 29) (pos-c 9) (type rural))
	(prior_cell (pos-r 29) (pos-c 10) (type rural))
	(prior_cell (pos-r 29) (pos-c 11) (type lake))
	(prior_cell (pos-r 29) (pos-c 12) (type rural))
	(prior_cell (pos-r 29) (pos-c 13) (type rural))
	(prior_cell (pos-r 29) (pos-c 14) (type rural))
	(prior_cell (pos-r 29) (pos-c 15) (type rural))
	(prior_cell (pos-r 29) (pos-c 16) (type rural))
	(prior_cell (pos-r 29) (pos-c 17) (type rural))
	(prior_cell (pos-r 29) (pos-c 18) (type hill))
	(prior_cell (pos-r 29) (pos-c 19) (type hill))
	(prior_cell (pos-r 29) (pos-c 20) (type hill))
	(prior_cell (pos-r 29) (pos-c 21) (type border))
	(prior_cell (pos-r 28) (pos-c 1) (type border))
	(prior_cell (pos-r 28) (pos-c 2) (type hill))
	(prior_cell (pos-r 28) (pos-c 3) (type hill))
	(prior_cell (pos-r 28) (pos-c 4) (type urban))
	(prior_cell (pos-r 28) (pos-c 5) (type urban))
	(prior_cell (pos-r 28) (pos-c 6) (type urban))
	(prior_cell (pos-r 28) (pos-c 7) (type rural))
	(prior_cell (pos-r 28) (pos-c 8) (type rural))
	(prior_cell (pos-r 28) (pos-c 9) (type rural))
	(prior_cell (pos-r 28) (pos-c 10) (type rural))
	(prior_cell (pos-r 28) (pos-c 11) (type lake))
	(prior_cell (pos-r 28) (pos-c 12) (type lake))
	(prior_cell (pos-r 28) (pos-c 13) (type lake))
	(prior_cell (pos-r 28) (pos-c 14) (type lake))
	(prior_cell (pos-r 28) (pos-c 15) (type rural))
	(prior_cell (pos-r 28) (pos-c 16) (type rural))
	(prior_cell (pos-r 28) (pos-c 17) (type rural))
	(prior_cell (pos-r 28) (pos-c 18) (type hill))
	(prior_cell (pos-r 28) (pos-c 19) (type hill))
	(prior_cell (pos-r 28) (pos-c 20) (type hill))
	(prior_cell (pos-r 28) (pos-c 21) (type border))
	(prior_cell (pos-r 27) (pos-c 1) (type border))
	(prior_cell (pos-r 27) (pos-c 2) (type rural))
	(prior_cell (pos-r 27) (pos-c 3) (type rural))
	(prior_cell (pos-r 27) (pos-c 4) (type urban))
	(prior_cell (pos-r 27) (pos-c 5) (type urban))
	(prior_cell (pos-r 27) (pos-c 6) (type urban))
	(prior_cell (pos-r 27) (pos-c 7) (type rural))
	(prior_cell (pos-r 27) (pos-c 8) (type urban))
	(prior_cell (pos-r 27) (pos-c 9) (type urban))
	(prior_cell (pos-r 27) (pos-c 10) (type rural))
	(prior_cell (pos-r 27) (pos-c 11) (type urban))
	(prior_cell (pos-r 27) (pos-c 12) (type urban))
	(prior_cell (pos-r 27) (pos-c 13) (type urban))
	(prior_cell (pos-r 27) (pos-c 14) (type lake))
	(prior_cell (pos-r 27) (pos-c 15) (type lake))
	(prior_cell (pos-r 27) (pos-c 16) (type rural))
	(prior_cell (pos-r 27) (pos-c 17) (type rural))
	(prior_cell (pos-r 27) (pos-c 18) (type rural))
	(prior_cell (pos-r 27) (pos-c 19) (type rural))
	(prior_cell (pos-r 27) (pos-c 20) (type hill))
	(prior_cell (pos-r 27) (pos-c 21) (type border))
	(prior_cell (pos-r 26) (pos-c 1) (type border))
	(prior_cell (pos-r 26) (pos-c 2) (type rural))
	(prior_cell (pos-r 26) (pos-c 3) (type rural))
	(prior_cell (pos-r 26) (pos-c 4) (type urban))
	(prior_cell (pos-r 26) (pos-c 5) (type urban))
	(prior_cell (pos-r 26) (pos-c 6) (type urban))
	(prior_cell (pos-r 26) (pos-c 7) (type rural))
	(prior_cell (pos-r 26) (pos-c 8) (type urban))
	(prior_cell (pos-r 26) (pos-c 9) (type urban))
	(prior_cell (pos-r 26) (pos-c 10) (type urban))
	(prior_cell (pos-r 26) (pos-c 11) (type urban))
	(prior_cell (pos-r 26) (pos-c 12) (type urban))
	(prior_cell (pos-r 26) (pos-c 13) (type rural))
	(prior_cell (pos-r 26) (pos-c 14) (type urban))
	(prior_cell (pos-r 26) (pos-c 15) (type lake))
	(prior_cell (pos-r 26) (pos-c 16) (type lake))
	(prior_cell (pos-r 26) (pos-c 17) (type rural))
	(prior_cell (pos-r 26) (pos-c 18) (type urban))
	(prior_cell (pos-r 26) (pos-c 19) (type rural))
	(prior_cell (pos-r 26) (pos-c 20) (type hill))
	(prior_cell (pos-r 26) (pos-c 21) (type border))
	(prior_cell (pos-r 25) (pos-c 1) (type gate))
	(prior_cell (pos-r 25) (pos-c 2) (type rural))
	(prior_cell (pos-r 25) (pos-c 3) (type rural))
	(prior_cell (pos-r 25) (pos-c 4) (type rural))
	(prior_cell (pos-r 25) (pos-c 5) (type rural))
	(prior_cell (pos-r 25) (pos-c 6) (type rural))
	(prior_cell (pos-r 25) (pos-c 7) (type rural))
	(prior_cell (pos-r 25) (pos-c 8) (type urban))
	(prior_cell (pos-r 25) (pos-c 9) (type urban))
	(prior_cell (pos-r 25) (pos-c 10) (type urban))
	(prior_cell (pos-r 25) (pos-c 11) (type urban))
	(prior_cell (pos-r 25) (pos-c 12) (type urban))
	(prior_cell (pos-r 25) (pos-c 13) (type urban))
	(prior_cell (pos-r 25) (pos-c 14) (type urban))
	(prior_cell (pos-r 25) (pos-c 15) (type urban))
	(prior_cell (pos-r 25) (pos-c 16) (type lake))
	(prior_cell (pos-r 25) (pos-c 17) (type rural))
	(prior_cell (pos-r 25) (pos-c 18) (type rural))
	(prior_cell (pos-r 25) (pos-c 19) (type rural))
	(prior_cell (pos-r 25) (pos-c 20) (type rural))
	(prior_cell (pos-r 25) (pos-c 21) (type border))
	(prior_cell (pos-r 24) (pos-c 1) (type border))
	(prior_cell (pos-r 24) (pos-c 2) (type rural))
	(prior_cell (pos-r 24) (pos-c 3) (type rural))
	(prior_cell (pos-r 24) (pos-c 4) (type rural))
	(prior_cell (pos-r 24) (pos-c 5) (type rural))
	(prior_cell (pos-r 24) (pos-c 6) (type rural))
	(prior_cell (pos-r 24) (pos-c 7) (type rural))
	(prior_cell (pos-r 24) (pos-c 8) (type urban))
	(prior_cell (pos-r 24) (pos-c 9) (type rural))
	(prior_cell (pos-r 24) (pos-c 10) (type urban))
	(prior_cell (pos-r 24) (pos-c 11) (type urban))
	(prior_cell (pos-r 24) (pos-c 12) (type urban))
	(prior_cell (pos-r 24) (pos-c 13) (type urban))
	(prior_cell (pos-r 24) (pos-c 14) (type urban))
	(prior_cell (pos-r 24) (pos-c 15) (type rural))
	(prior_cell (pos-r 24) (pos-c 16) (type lake))
	(prior_cell (pos-r 24) (pos-c 17) (type rural))
	(prior_cell (pos-r 24) (pos-c 18) (type rural))
	(prior_cell (pos-r 24) (pos-c 19) (type rural))
	(prior_cell (pos-r 24) (pos-c 20) (type rural))
	(prior_cell (pos-r 24) (pos-c 21) (type border))
	(prior_cell (pos-r 23) (pos-c 1) (type border))
	(prior_cell (pos-r 23) (pos-c 2) (type hill))
	(prior_cell (pos-r 23) (pos-c 3) (type hill))
	(prior_cell (pos-r 23) (pos-c 4) (type hill))
	(prior_cell (pos-r 23) (pos-c 5) (type hill))
	(prior_cell (pos-r 23) (pos-c 6) (type hill))
	(prior_cell (pos-r 23) (pos-c 7) (type hill))
	(prior_cell (pos-r 23) (pos-c 8) (type rural))
	(prior_cell (pos-r 23) (pos-c 9) (type rural))
	(prior_cell (pos-r 23) (pos-c 10) (type rural))
	(prior_cell (pos-r 23) (pos-c 11) (type urban))
	(prior_cell (pos-r 23) (pos-c 12) (type urban))
	(prior_cell (pos-r 23) (pos-c 13) (type urban))
	(prior_cell (pos-r 23) (pos-c 14) (type rural))
	(prior_cell (pos-r 23) (pos-c 15) (type rural))
	(prior_cell (pos-r 23) (pos-c 16) (type lake))
	(prior_cell (pos-r 23) (pos-c 17) (type rural))
	(prior_cell (pos-r 23) (pos-c 18) (type rural))
	(prior_cell (pos-r 23) (pos-c 19) (type rural))
	(prior_cell (pos-r 23) (pos-c 20) (type rural))
	(prior_cell (pos-r 23) (pos-c 21) (type border))
	(prior_cell (pos-r 22) (pos-c 1) (type border))
	(prior_cell (pos-r 22) (pos-c 2) (type hill))
	(prior_cell (pos-r 22) (pos-c 3) (type hill))
	(prior_cell (pos-r 22) (pos-c 4) (type hill))
	(prior_cell (pos-r 22) (pos-c 5) (type hill))
	(prior_cell (pos-r 22) (pos-c 6) (type hill))
	(prior_cell (pos-r 22) (pos-c 7) (type rural))
	(prior_cell (pos-r 22) (pos-c 8) (type rural))
	(prior_cell (pos-r 22) (pos-c 9) (type rural))
	(prior_cell (pos-r 22) (pos-c 10) (type rural))
	(prior_cell (pos-r 22) (pos-c 11) (type rural))
	(prior_cell (pos-r 22) (pos-c 12) (type rural))
	(prior_cell (pos-r 22) (pos-c 13) (type rural))
	(prior_cell (pos-r 22) (pos-c 14) (type rural))
	(prior_cell (pos-r 22) (pos-c 15) (type rural))
	(prior_cell (pos-r 22) (pos-c 16) (type lake))
	(prior_cell (pos-r 22) (pos-c 17) (type rural))
	(prior_cell (pos-r 22) (pos-c 18) (type rural))
	(prior_cell (pos-r 22) (pos-c 19) (type rural))
	(prior_cell (pos-r 22) (pos-c 20) (type rural))
	(prior_cell (pos-r 22) (pos-c 21) (type border))
	(prior_cell (pos-r 21) (pos-c 1) (type border))
	(prior_cell (pos-r 21) (pos-c 2) (type hill))
	(prior_cell (pos-r 21) (pos-c 3) (type hill))
	(prior_cell (pos-r 21) (pos-c 4) (type rural))
	(prior_cell (pos-r 21) (pos-c 5) (type rural))
	(prior_cell (pos-r 21) (pos-c 6) (type rural))
	(prior_cell (pos-r 21) (pos-c 7) (type rural))
	(prior_cell (pos-r 21) (pos-c 8) (type rural))
	(prior_cell (pos-r 21) (pos-c 9) (type rural))
	(prior_cell (pos-r 21) (pos-c 10) (type rural))
	(prior_cell (pos-r 21) (pos-c 11) (type rural))
	(prior_cell (pos-r 21) (pos-c 12) (type rural))
	(prior_cell (pos-r 21) (pos-c 13) (type rural))
	(prior_cell (pos-r 21) (pos-c 14) (type rural))
	(prior_cell (pos-r 21) (pos-c 15) (type rural))
	(prior_cell (pos-r 21) (pos-c 16) (type lake))
	(prior_cell (pos-r 21) (pos-c 17) (type rural))
	(prior_cell (pos-r 21) (pos-c 18) (type rural))
	(prior_cell (pos-r 21) (pos-c 19) (type rural))
	(prior_cell (pos-r 21) (pos-c 20) (type rural))
	(prior_cell (pos-r 21) (pos-c 21) (type border))
	(prior_cell (pos-r 20) (pos-c 1) (type border))
	(prior_cell (pos-r 20) (pos-c 2) (type rural))
	(prior_cell (pos-r 20) (pos-c 3) (type rural))
	(prior_cell (pos-r 20) (pos-c 4) (type rural))
	(prior_cell (pos-r 20) (pos-c 5) (type rural))
	(prior_cell (pos-r 20) (pos-c 6) (type lake))
	(prior_cell (pos-r 20) (pos-c 7) (type rural))
	(prior_cell (pos-r 20) (pos-c 8) (type rural))
	(prior_cell (pos-r 20) (pos-c 9) (type rural))
	(prior_cell (pos-r 20) (pos-c 10) (type rural))
	(prior_cell (pos-r 20) (pos-c 11) (type rural))
	(prior_cell (pos-r 20) (pos-c 12) (type hill))
	(prior_cell (pos-r 20) (pos-c 13) (type hill))
	(prior_cell (pos-r 20) (pos-c 14) (type rural))
	(prior_cell (pos-r 20) (pos-c 15) (type lake))
	(prior_cell (pos-r 20) (pos-c 16) (type lake))
	(prior_cell (pos-r 20) (pos-c 17) (type rural))
	(prior_cell (pos-r 20) (pos-c 18) (type rural))
	(prior_cell (pos-r 20) (pos-c 19) (type rural))
	(prior_cell (pos-r 20) (pos-c 20) (type rural))
	(prior_cell (pos-r 20) (pos-c 21) (type gate))
	(prior_cell (pos-r 19) (pos-c 1) (type border))
	(prior_cell (pos-r 19) (pos-c 2) (type rural))
	(prior_cell (pos-r 19) (pos-c 3) (type rural))
	(prior_cell (pos-r 19) (pos-c 4) (type rural))
	(prior_cell (pos-r 19) (pos-c 5) (type lake))
	(prior_cell (pos-r 19) (pos-c 6) (type lake))
	(prior_cell (pos-r 19) (pos-c 7) (type lake))
	(prior_cell (pos-r 19) (pos-c 8) (type rural))
	(prior_cell (pos-r 19) (pos-c 9) (type rural))
	(prior_cell (pos-r 19) (pos-c 10) (type rural))
	(prior_cell (pos-r 19) (pos-c 11) (type hill))
	(prior_cell (pos-r 19) (pos-c 12) (type hill))
	(prior_cell (pos-r 19) (pos-c 13) (type lake))
	(prior_cell (pos-r 19) (pos-c 14) (type lake))
	(prior_cell (pos-r 19) (pos-c 15) (type lake))
	(prior_cell (pos-r 19) (pos-c 16) (type rural))
	(prior_cell (pos-r 19) (pos-c 17) (type rural))
	(prior_cell (pos-r 19) (pos-c 18) (type rural))
	(prior_cell (pos-r 19) (pos-c 19) (type urban))
	(prior_cell (pos-r 19) (pos-c 20) (type urban))
	(prior_cell (pos-r 19) (pos-c 21) (type border))
	(prior_cell (pos-r 18) (pos-c 1) (type border))
	(prior_cell (pos-r 18) (pos-c 2) (type rural))
	(prior_cell (pos-r 18) (pos-c 3) (type rural))
	(prior_cell (pos-r 18) (pos-c 4) (type rural))
	(prior_cell (pos-r 18) (pos-c 5) (type urban))
	(prior_cell (pos-r 18) (pos-c 6) (type lake))
	(prior_cell (pos-r 18) (pos-c 7) (type urban))
	(prior_cell (pos-r 18) (pos-c 8) (type urban))
	(prior_cell (pos-r 18) (pos-c 9) (type rural))
	(prior_cell (pos-r 18) (pos-c 10) (type rural))
	(prior_cell (pos-r 18) (pos-c 11) (type hill))
	(prior_cell (pos-r 18) (pos-c 12) (type rural))
	(prior_cell (pos-r 18) (pos-c 13) (type lake))
	(prior_cell (pos-r 18) (pos-c 14) (type rural))
	(prior_cell (pos-r 18) (pos-c 15) (type urban))
	(prior_cell (pos-r 18) (pos-c 16) (type urban))
	(prior_cell (pos-r 18) (pos-c 17) (type urban))
	(prior_cell (pos-r 18) (pos-c 18) (type urban))
	(prior_cell (pos-r 18) (pos-c 19) (type urban))
	(prior_cell (pos-r 18) (pos-c 20) (type urban))
	(prior_cell (pos-r 18) (pos-c 21) (type border))
	(prior_cell (pos-r 17) (pos-c 1) (type border))
	(prior_cell (pos-r 17) (pos-c 2) (type rural))
	(prior_cell (pos-r 17) (pos-c 3) (type rural))
	(prior_cell (pos-r 17) (pos-c 4) (type rural))
	(prior_cell (pos-r 17) (pos-c 5) (type urban))
	(prior_cell (pos-r 17) (pos-c 6) (type urban))
	(prior_cell (pos-r 17) (pos-c 7) (type urban))
	(prior_cell (pos-r 17) (pos-c 8) (type urban))
	(prior_cell (pos-r 17) (pos-c 9) (type rural))
	(prior_cell (pos-r 17) (pos-c 10) (type rural))
	(prior_cell (pos-r 17) (pos-c 11) (type rural))
	(prior_cell (pos-r 17) (pos-c 12) (type rural))
	(prior_cell (pos-r 17) (pos-c 13) (type lake))
	(prior_cell (pos-r 17) (pos-c 14) (type urban))
	(prior_cell (pos-r 17) (pos-c 15) (type urban))
	(prior_cell (pos-r 17) (pos-c 16) (type urban))
	(prior_cell (pos-r 17) (pos-c 17) (type urban))
	(prior_cell (pos-r 17) (pos-c 18) (type urban))
	(prior_cell (pos-r 17) (pos-c 19) (type urban))
	(prior_cell (pos-r 17) (pos-c 20) (type urban))
	(prior_cell (pos-r 17) (pos-c 21) (type border))
	(prior_cell (pos-r 16) (pos-c 1) (type gate))
	(prior_cell (pos-r 16) (pos-c 2) (type rural))
	(prior_cell (pos-r 16) (pos-c 3) (type rural))
	(prior_cell (pos-r 16) (pos-c 4) (type urban))
	(prior_cell (pos-r 16) (pos-c 5) (type urban))
	(prior_cell (pos-r 16) (pos-c 6) (type urban))
	(prior_cell (pos-r 16) (pos-c 7) (type urban))
	(prior_cell (pos-r 16) (pos-c 8) (type urban))
	(prior_cell (pos-r 16) (pos-c 9) (type rural))
	(prior_cell (pos-r 16) (pos-c 10) (type rural))
	(prior_cell (pos-r 16) (pos-c 11) (type rural))
	(prior_cell (pos-r 16) (pos-c 12) (type rural))
	(prior_cell (pos-r 16) (pos-c 13) (type lake))
	(prior_cell (pos-r 16) (pos-c 14) (type rural))
	(prior_cell (pos-r 16) (pos-c 15) (type urban))
	(prior_cell (pos-r 16) (pos-c 16) (type urban))
	(prior_cell (pos-r 16) (pos-c 17) (type urban))
	(prior_cell (pos-r 16) (pos-c 18) (type urban))
	(prior_cell (pos-r 16) (pos-c 19) (type urban))
	(prior_cell (pos-r 16) (pos-c 20) (type rural))
	(prior_cell (pos-r 16) (pos-c 21) (type border))
	(prior_cell (pos-r 15) (pos-c 1) (type border))
	(prior_cell (pos-r 15) (pos-c 2) (type rural))
	(prior_cell (pos-r 15) (pos-c 3) (type rural))
	(prior_cell (pos-r 15) (pos-c 4) (type rural))
	(prior_cell (pos-r 15) (pos-c 5) (type urban))
	(prior_cell (pos-r 15) (pos-c 6) (type urban))
	(prior_cell (pos-r 15) (pos-c 7) (type urban))
	(prior_cell (pos-r 15) (pos-c 8) (type urban))
	(prior_cell (pos-r 15) (pos-c 9) (type rural))
	(prior_cell (pos-r 15) (pos-c 10) (type rural))
	(prior_cell (pos-r 15) (pos-c 11) (type rural))
	(prior_cell (pos-r 15) (pos-c 12) (type rural))
	(prior_cell (pos-r 15) (pos-c 13) (type lake))
	(prior_cell (pos-r 15) (pos-c 14) (type rural))
	(prior_cell (pos-r 15) (pos-c 15) (type rural))
	(prior_cell (pos-r 15) (pos-c 16) (type urban))
	(prior_cell (pos-r 15) (pos-c 17) (type urban))
	(prior_cell (pos-r 15) (pos-c 18) (type urban))
	(prior_cell (pos-r 15) (pos-c 19) (type rural))
	(prior_cell (pos-r 15) (pos-c 20) (type rural))
	(prior_cell (pos-r 15) (pos-c 21) (type border))
	(prior_cell (pos-r 14) (pos-c 1) (type border))
	(prior_cell (pos-r 14) (pos-c 2) (type rural))
	(prior_cell (pos-r 14) (pos-c 3) (type rural))
	(prior_cell (pos-r 14) (pos-c 4) (type rural))
	(prior_cell (pos-r 14) (pos-c 5) (type rural))
	(prior_cell (pos-r 14) (pos-c 6) (type urban))
	(prior_cell (pos-r 14) (pos-c 7) (type urban))
	(prior_cell (pos-r 14) (pos-c 8) (type urban))
	(prior_cell (pos-r 14) (pos-c 9) (type rural))
	(prior_cell (pos-r 14) (pos-c 10) (type rural))
	(prior_cell (pos-r 14) (pos-c 11) (type lake))
	(prior_cell (pos-r 14) (pos-c 12) (type lake))
	(prior_cell (pos-r 14) (pos-c 13) (type lake))
	(prior_cell (pos-r 14) (pos-c 14) (type rural))
	(prior_cell (pos-r 14) (pos-c 15) (type rural))
	(prior_cell (pos-r 14) (pos-c 16) (type urban))
	(prior_cell (pos-r 14) (pos-c 17) (type rural))
	(prior_cell (pos-r 14) (pos-c 18) (type urban))
	(prior_cell (pos-r 14) (pos-c 19) (type rural))
	(prior_cell (pos-r 14) (pos-c 20) (type rural))
	(prior_cell (pos-r 14) (pos-c 21) (type border))
	(prior_cell (pos-r 13) (pos-c 1) (type border))
	(prior_cell (pos-r 13) (pos-c 2) (type rural))
	(prior_cell (pos-r 13) (pos-c 3) (type rural))
	(prior_cell (pos-r 13) (pos-c 4) (type rural))
	(prior_cell (pos-r 13) (pos-c 5) (type rural))
	(prior_cell (pos-r 13) (pos-c 6) (type rural))
	(prior_cell (pos-r 13) (pos-c 7) (type rural))
	(prior_cell (pos-r 13) (pos-c 8) (type rural))
	(prior_cell (pos-r 13) (pos-c 9) (type rural))
	(prior_cell (pos-r 13) (pos-c 10) (type rural))
	(prior_cell (pos-r 13) (pos-c 11) (type lake))
	(prior_cell (pos-r 13) (pos-c 12) (type rural))
	(prior_cell (pos-r 13) (pos-c 13) (type rural))
	(prior_cell (pos-r 13) (pos-c 14) (type rural))
	(prior_cell (pos-r 13) (pos-c 15) (type rural))
	(prior_cell (pos-r 13) (pos-c 16) (type rural))
	(prior_cell (pos-r 13) (pos-c 17) (type rural))
	(prior_cell (pos-r 13) (pos-c 18) (type rural))
	(prior_cell (pos-r 13) (pos-c 19) (type rural))
	(prior_cell (pos-r 13) (pos-c 20) (type rural))
	(prior_cell (pos-r 13) (pos-c 21) (type border))
	(prior_cell (pos-r 12) (pos-c 1) (type border))
	(prior_cell (pos-r 12) (pos-c 2) (type rural))
	(prior_cell (pos-r 12) (pos-c 3) (type rural))
	(prior_cell (pos-r 12) (pos-c 4) (type rural))
	(prior_cell (pos-r 12) (pos-c 5) (type rural))
	(prior_cell (pos-r 12) (pos-c 6) (type rural))
	(prior_cell (pos-r 12) (pos-c 7) (type rural))
	(prior_cell (pos-r 12) (pos-c 8) (type lake))
	(prior_cell (pos-r 12) (pos-c 9) (type lake))
	(prior_cell (pos-r 12) (pos-c 10) (type lake))
	(prior_cell (pos-r 12) (pos-c 11) (type lake))
	(prior_cell (pos-r 12) (pos-c 12) (type rural))
	(prior_cell (pos-r 12) (pos-c 13) (type rural))
	(prior_cell (pos-r 12) (pos-c 14) (type rural))
	(prior_cell (pos-r 12) (pos-c 15) (type rural))
	(prior_cell (pos-r 12) (pos-c 16) (type rural))
	(prior_cell (pos-r 12) (pos-c 17) (type rural))
	(prior_cell (pos-r 12) (pos-c 18) (type rural))
	(prior_cell (pos-r 12) (pos-c 19) (type rural))
	(prior_cell (pos-r 12) (pos-c 20) (type rural))
	(prior_cell (pos-r 12) (pos-c 21) (type border))
	(prior_cell (pos-r 11) (pos-c 1) (type border))
	(prior_cell (pos-r 11) (pos-c 2) (type rural))
	(prior_cell (pos-r 11) (pos-c 3) (type rural))
	(prior_cell (pos-r 11) (pos-c 4) (type rural))
	(prior_cell (pos-r 11) (pos-c 5) (type rural))
	(prior_cell (pos-r 11) (pos-c 6) (type rural))
	(prior_cell (pos-r 11) (pos-c 7) (type rural))
	(prior_cell (pos-r 11) (pos-c 8) (type lake))
	(prior_cell (pos-r 11) (pos-c 9) (type hill))
	(prior_cell (pos-r 11) (pos-c 10) (type rural))
	(prior_cell (pos-r 11) (pos-c 11) (type rural))
	(prior_cell (pos-r 11) (pos-c 12) (type rural))
	(prior_cell (pos-r 11) (pos-c 13) (type rural))
	(prior_cell (pos-r 11) (pos-c 14) (type rural))
	(prior_cell (pos-r 11) (pos-c 15) (type rural))
	(prior_cell (pos-r 11) (pos-c 16) (type rural))
	(prior_cell (pos-r 11) (pos-c 17) (type hill))
	(prior_cell (pos-r 11) (pos-c 18) (type hill))
	(prior_cell (pos-r 11) (pos-c 19) (type hill))
	(prior_cell (pos-r 11) (pos-c 20) (type hill))
	(prior_cell (pos-r 11) (pos-c 21) (type border))
	(prior_cell (pos-r 10) (pos-c 1) (type border))
	(prior_cell (pos-r 10) (pos-c 2) (type rural))
	(prior_cell (pos-r 10) (pos-c 3) (type rural))
	(prior_cell (pos-r 10) (pos-c 4) (type rural))
	(prior_cell (pos-r 10) (pos-c 5) (type rural))
	(prior_cell (pos-r 10) (pos-c 6) (type lake))
	(prior_cell (pos-r 10) (pos-c 7) (type lake))
	(prior_cell (pos-r 10) (pos-c 8) (type lake))
	(prior_cell (pos-r 10) (pos-c 9) (type hill))
	(prior_cell (pos-r 10) (pos-c 10) (type hill))
	(prior_cell (pos-r 10) (pos-c 11) (type rural))
	(prior_cell (pos-r 10) (pos-c 12) (type rural))
	(prior_cell (pos-r 10) (pos-c 13) (type urban))
	(prior_cell (pos-r 10) (pos-c 14) (type rural))
	(prior_cell (pos-r 10) (pos-c 15) (type rural))
	(prior_cell (pos-r 10) (pos-c 16) (type rural))
	(prior_cell (pos-r 10) (pos-c 17) (type rural))
	(prior_cell (pos-r 10) (pos-c 18) (type hill))
	(prior_cell (pos-r 10) (pos-c 19) (type hill))
	(prior_cell (pos-r 10) (pos-c 20) (type rural))
	(prior_cell (pos-r 10) (pos-c 21) (type gate))
	(prior_cell (pos-r 9) (pos-c 1) (type border))
	(prior_cell (pos-r 9) (pos-c 2) (type rural))
	(prior_cell (pos-r 9) (pos-c 3) (type rural))
	(prior_cell (pos-r 9) (pos-c 4) (type rural))
	(prior_cell (pos-r 9) (pos-c 5) (type rural))
	(prior_cell (pos-r 9) (pos-c 6) (type lake))
	(prior_cell (pos-r 9) (pos-c 7) (type rural))
	(prior_cell (pos-r 9) (pos-c 8) (type hill))
	(prior_cell (pos-r 9) (pos-c 9) (type rural))
	(prior_cell (pos-r 9) (pos-c 10) (type rural))
	(prior_cell (pos-r 9) (pos-c 11) (type urban))
	(prior_cell (pos-r 9) (pos-c 12) (type urban))
	(prior_cell (pos-r 9) (pos-c 13) (type urban))
	(prior_cell (pos-r 9) (pos-c 14) (type urban))
	(prior_cell (pos-r 9) (pos-c 15) (type rural))
	(prior_cell (pos-r 9) (pos-c 16) (type rural))
	(prior_cell (pos-r 9) (pos-c 17) (type rural))
	(prior_cell (pos-r 9) (pos-c 18) (type rural))
	(prior_cell (pos-r 9) (pos-c 19) (type rural))
	(prior_cell (pos-r 9) (pos-c 20) (type rural))
	(prior_cell (pos-r 9) (pos-c 21) (type border))
	(prior_cell (pos-r 8) (pos-c 1) (type border))
	(prior_cell (pos-r 8) (pos-c 2) (type rural))
	(prior_cell (pos-r 8) (pos-c 3) (type rural))
	(prior_cell (pos-r 8) (pos-c 4) (type rural))
	(prior_cell (pos-r 8) (pos-c 5) (type rural))
	(prior_cell (pos-r 8) (pos-c 6) (type lake))
	(prior_cell (pos-r 8) (pos-c 7) (type hill))
	(prior_cell (pos-r 8) (pos-c 8) (type hill))
	(prior_cell (pos-r 8) (pos-c 9) (type rural))
	(prior_cell (pos-r 8) (pos-c 10) (type rural))
	(prior_cell (pos-r 8) (pos-c 11) (type urban))
	(prior_cell (pos-r 8) (pos-c 12) (type urban))
	(prior_cell (pos-r 8) (pos-c 13) (type urban))
	(prior_cell (pos-r 8) (pos-c 14) (type urban))
	(prior_cell (pos-r 8) (pos-c 15) (type rural))
	(prior_cell (pos-r 8) (pos-c 16) (type rural))
	(prior_cell (pos-r 8) (pos-c 17) (type rural))
	(prior_cell (pos-r 8) (pos-c 18) (type lake))
	(prior_cell (pos-r 8) (pos-c 19) (type lake))
	(prior_cell (pos-r 8) (pos-c 20) (type lake))
	(prior_cell (pos-r 8) (pos-c 21) (type border))
	(prior_cell (pos-r 7) (pos-c 1) (type border))
	(prior_cell (pos-r 7) (pos-c 2) (type rural))
	(prior_cell (pos-r 7) (pos-c 3) (type urban))
	(prior_cell (pos-r 7) (pos-c 4) (type rural))
	(prior_cell (pos-r 7) (pos-c 5) (type rural))
	(prior_cell (pos-r 7) (pos-c 6) (type lake))
	(prior_cell (pos-r 7) (pos-c 7) (type hill))
	(prior_cell (pos-r 7) (pos-c 8) (type rural))
	(prior_cell (pos-r 7) (pos-c 9) (type rural))
	(prior_cell (pos-r 7) (pos-c 10) (type rural))
	(prior_cell (pos-r 7) (pos-c 11) (type urban))
	(prior_cell (pos-r 7) (pos-c 12) (type urban))
	(prior_cell (pos-r 7) (pos-c 13) (type urban))
	(prior_cell (pos-r 7) (pos-c 14) (type urban))
	(prior_cell (pos-r 7) (pos-c 15) (type rural))
	(prior_cell (pos-r 7) (pos-c 16) (type rural))
	(prior_cell (pos-r 7) (pos-c 17) (type lake))
	(prior_cell (pos-r 7) (pos-c 18) (type lake))
	(prior_cell (pos-r 7) (pos-c 19) (type lake))
	(prior_cell (pos-r 7) (pos-c 20) (type lake))
	(prior_cell (pos-r 7) (pos-c 21) (type border))
	(prior_cell (pos-r 6) (pos-c 1) (type gate))
	(prior_cell (pos-r 6) (pos-c 2) (type urban))
	(prior_cell (pos-r 6) (pos-c 3) (type urban))
	(prior_cell (pos-r 6) (pos-c 4) (type urban))
	(prior_cell (pos-r 6) (pos-c 5) (type rural))
	(prior_cell (pos-r 6) (pos-c 6) (type lake))
	(prior_cell (pos-r 6) (pos-c 7) (type rural))
	(prior_cell (pos-r 6) (pos-c 8) (type rural))
	(prior_cell (pos-r 6) (pos-c 9) (type rural))
	(prior_cell (pos-r 6) (pos-c 10) (type rural))
	(prior_cell (pos-r 6) (pos-c 11) (type urban))
	(prior_cell (pos-r 6) (pos-c 12) (type urban))
	(prior_cell (pos-r 6) (pos-c 13) (type urban))
	(prior_cell (pos-r 6) (pos-c 14) (type urban))
	(prior_cell (pos-r 6) (pos-c 15) (type rural))
	(prior_cell (pos-r 6) (pos-c 16) (type rural))
	(prior_cell (pos-r 6) (pos-c 17) (type lake))
	(prior_cell (pos-r 6) (pos-c 18) (type lake))
	(prior_cell (pos-r 6) (pos-c 19) (type rural))
	(prior_cell (pos-r 6) (pos-c 20) (type rural))
	(prior_cell (pos-r 6) (pos-c 21) (type border))
	(prior_cell (pos-r 5) (pos-c 1) (type border))
	(prior_cell (pos-r 5) (pos-c 2) (type urban))
	(prior_cell (pos-r 5) (pos-c 3) (type urban))
	(prior_cell (pos-r 5) (pos-c 4) (type urban))
	(prior_cell (pos-r 5) (pos-c 5) (type lake))
	(prior_cell (pos-r 5) (pos-c 6) (type lake))
	(prior_cell (pos-r 5) (pos-c 7) (type rural))
	(prior_cell (pos-r 5) (pos-c 8) (type rural))
	(prior_cell (pos-r 5) (pos-c 9) (type rural))
	(prior_cell (pos-r 5) (pos-c 10) (type rural))
	(prior_cell (pos-r 5) (pos-c 11) (type rural))
	(prior_cell (pos-r 5) (pos-c 12) (type rural))
	(prior_cell (pos-r 5) (pos-c 13) (type rural))
	(prior_cell (pos-r 5) (pos-c 14) (type rural))
	(prior_cell (pos-r 5) (pos-c 15) (type rural))
	(prior_cell (pos-r 5) (pos-c 16) (type rural))
	(prior_cell (pos-r 5) (pos-c 17) (type rural))
	(prior_cell (pos-r 5) (pos-c 18) (type rural))
	(prior_cell (pos-r 5) (pos-c 19) (type rural))
	(prior_cell (pos-r 5) (pos-c 20) (type rural))
	(prior_cell (pos-r 5) (pos-c 21) (type border))
	(prior_cell (pos-r 4) (pos-c 1) (type border))
	(prior_cell (pos-r 4) (pos-c 2) (type urban))
	(prior_cell (pos-r 4) (pos-c 3) (type urban))
	(prior_cell (pos-r 4) (pos-c 4) (type lake))
	(prior_cell (pos-r 4) (pos-c 5) (type urban))
	(prior_cell (pos-r 4) (pos-c 6) (type rural))
	(prior_cell (pos-r 4) (pos-c 7) (type rural))
	(prior_cell (pos-r 4) (pos-c 8) (type rural))
	(prior_cell (pos-r 4) (pos-c 9) (type rural))
	(prior_cell (pos-r 4) (pos-c 10) (type rural))
	(prior_cell (pos-r 4) (pos-c 11) (type rural))
	(prior_cell (pos-r 4) (pos-c 12) (type rural))
	(prior_cell (pos-r 4) (pos-c 13) (type rural))
	(prior_cell (pos-r 4) (pos-c 14) (type rural))
	(prior_cell (pos-r 4) (pos-c 15) (type rural))
	(prior_cell (pos-r 4) (pos-c 16) (type rural))
	(prior_cell (pos-r 4) (pos-c 17) (type rural))
	(prior_cell (pos-r 4) (pos-c 18) (type rural))
	(prior_cell (pos-r 4) (pos-c 19) (type rural))
	(prior_cell (pos-r 4) (pos-c 20) (type rural))
	(prior_cell (pos-r 4) (pos-c 21) (type border))
	(prior_cell (pos-r 3) (pos-c 1) (type border))
	(prior_cell (pos-r 3) (pos-c 2) (type lake))
	(prior_cell (pos-r 3) (pos-c 3) (type lake))
	(prior_cell (pos-r 3) (pos-c 4) (type lake))
	(prior_cell (pos-r 3) (pos-c 5) (type rural))
	(prior_cell (pos-r 3) (pos-c 6) (type rural))
	(prior_cell (pos-r 3) (pos-c 7) (type rural))
	(prior_cell (pos-r 3) (pos-c 8) (type rural))
	(prior_cell (pos-r 3) (pos-c 9) (type rural))
	(prior_cell (pos-r 3) (pos-c 10) (type rural))
	(prior_cell (pos-r 3) (pos-c 11) (type rural))
	(prior_cell (pos-r 3) (pos-c 12) (type rural))
	(prior_cell (pos-r 3) (pos-c 13) (type rural))
	(prior_cell (pos-r 3) (pos-c 14) (type rural))
	(prior_cell (pos-r 3) (pos-c 15) (type rural))
	(prior_cell (pos-r 3) (pos-c 16) (type rural))
	(prior_cell (pos-r 3) (pos-c 17) (type rural))
	(prior_cell (pos-r 3) (pos-c 18) (type rural))
	(prior_cell (pos-r 3) (pos-c 19) (type rural))
	(prior_cell (pos-r 3) (pos-c 20) (type rural))
	(prior_cell (pos-r 3) (pos-c 21) (type border))
	(prior_cell (pos-r 2) (pos-c 1) (type border))
	(prior_cell (pos-r 2) (pos-c 2) (type lake))
	(prior_cell (pos-r 2) (pos-c 3) (type urban))
	(prior_cell (pos-r 2) (pos-c 4) (type urban))
	(prior_cell (pos-r 2) (pos-c 5) (type rural))
	(prior_cell (pos-r 2) (pos-c 6) (type rural))
	(prior_cell (pos-r 2) (pos-c 7) (type rural))
	(prior_cell (pos-r 2) (pos-c 8) (type rural))
	(prior_cell (pos-r 2) (pos-c 9) (type rural))
	(prior_cell (pos-r 2) (pos-c 10) (type rural))
	(prior_cell (pos-r 2) (pos-c 11) (type rural))
	(prior_cell (pos-r 2) (pos-c 12) (type rural))
	(prior_cell (pos-r 2) (pos-c 13) (type rural))
	(prior_cell (pos-r 2) (pos-c 14) (type rural))
	(prior_cell (pos-r 2) (pos-c 15) (type rural))
	(prior_cell (pos-r 2) (pos-c 16) (type rural))
	(prior_cell (pos-r 2) (pos-c 17) (type rural))
	(prior_cell (pos-r 2) (pos-c 18) (type rural))
	(prior_cell (pos-r 2) (pos-c 19) (type rural))
	(prior_cell (pos-r 2) (pos-c 20) (type rural))
	(prior_cell (pos-r 2) (pos-c 21) (type border))
	(prior_cell (pos-r 1) (pos-c 1) (type border))
	(prior_cell (pos-r 1) (pos-c 2) (type border))
	(prior_cell (pos-r 1) (pos-c 3) (type border))
	(prior_cell (pos-r 1) (pos-c 4) (type border))
	(prior_cell (pos-r 1) (pos-c 5) (type border))
	(prior_cell (pos-r 1) (pos-c 6) (type border))
	(prior_cell (pos-r 1) (pos-c 7) (type border))
	(prior_cell (pos-r 1) (pos-c 8) (type border))
	(prior_cell (pos-r 1) (pos-c 9) (type border))
	(prior_cell (pos-r 1) (pos-c 10) (type border))
	(prior_cell (pos-r 1) (pos-c 11) (type border))
	(prior_cell (pos-r 1) (pos-c 12) (type border))
	(prior_cell (pos-r 1) (pos-c 13) (type border))
	(prior_cell (pos-r 1) (pos-c 14) (type border))
	(prior_cell (pos-r 1) (pos-c 15) (type border))
	(prior_cell (pos-r 1) (pos-c 16) (type border))
	(prior_cell (pos-r 1) (pos-c 17) (type border))
	(prior_cell (pos-r 1) (pos-c 18) (type border))
	(prior_cell (pos-r 1) (pos-c 19) (type gate))
	(prior_cell (pos-r 1) (pos-c 20) (type border))
	(prior_cell (pos-r 1) (pos-c 21) (type border))
)