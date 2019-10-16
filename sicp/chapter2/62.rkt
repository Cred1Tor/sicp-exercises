#lang sicp

(#%require rackunit)

(define (union-set set1 set2)
  (cond [(null? set1) set2]
	[(null? set2) set1]
	[else (let ((x1 (car set1)) (x2 (car set2)))
		(cond [(= x1 x2) (union-set (cdr set1) set2)]
		      [(< x1 x2) (cons x1 (union-set (cdr set1) set2))]
		      [(< x2 x1) (cons x2 (union-set set1 (cdr set2)))]))]))

(check-equal? (union-set (list 0 2 5 10)
	   		 (list 1 2 3 4 5 12))
	      (list 0 1 2 3 4 5 10 12))

(check-equal? (union-set (list 1 2 3 5 7 9)
	   		 (list 0 1 3 4 6 9))
	      (list 0 1 2 3 4 5 6 7 9))
