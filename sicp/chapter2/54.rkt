#lang sicp

(#%require rackunit)

(define (equal? item1 item2)
  (cond [(or (not (pair? item1))
	      (not (pair? item2))) (eq? item1 item2)]
        [else 
	  (and (equal? (car item1) (car item2))
	       (equal? (cdr item1) (cdr item2)))]))

(check-equal? (equal? `(this is a list) `(this is a list)) #t)
(check-equal? (equal? `(this is a list) `(this (is a) list)) #f)

