#lang sicp

(#%require rackunit)
(#%require "42.rkt")

(#%provide repeated)

(define (repeated f n)
  (if (= n 1)
    f
    (repeated (compose f f) (- n 1))))

(define (square x) (* x x))

(check-equal? ((repeated square 2) 5) 625)
