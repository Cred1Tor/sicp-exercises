#lang sicp

(#%require rackunit)

(#%provide make-interval upper-bound lower-bound)

(define (make-interval a b) (cons a b))

(define (upper-bound interval) (cdr interval))

(define (lower-bound interval) (car interval))

(define test (make-interval 1 2))

(check-equal? (upper-bound test) 2)
(check-equal? (lower-bound test) 1)
