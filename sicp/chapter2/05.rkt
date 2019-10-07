#lang sicp

(#%require rackunit)

(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (divides-count x y)
  (if (= (remainder x y)
	 0)
    (+ 1 (divides-count (/ x y) y))
    0))

(define (car num) (divides-count num 2))

(define (cdr num) (divides-count num 3))

(define test (cons 2 3))

(check-equal? test 108)
(check-equal? (car test) 2)
(check-equal? (cdr test) 3)
