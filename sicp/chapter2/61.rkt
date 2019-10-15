#lang sicp

(#%require rackunit)

(define (adjoin-set x set2)
  (cond [(null? set2) (list x)]
    	[(= (car set2) x) set2]
	[(< x (car set2)) (cons x set2)]
	[else (cons (car set2) (adjoin-set x (cdr set2)))]))

(check-equal? (adjoin-set 4 (list 1 2 5 6)) (list 1 2 4 5 6))
(check-equal? (adjoin-set 4 (list 1 2 3 4)) (list 1 2 3 4))
(check-equal? (adjoin-set 4 (list 1 2 3)) (list 1 2 3 4))
(check-equal? (adjoin-set 4 (list 5 6 7)) (list 4 5 6 7))
