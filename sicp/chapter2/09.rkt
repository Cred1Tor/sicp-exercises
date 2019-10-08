#lang sicp

(#%require "07.rkt")
(#%require "08.rkt")
(#%require rackunit)

(define (radius-interval a)
  (- (upper-bound a)
     (lower-bound a)))

(define int1 (make-interval 3 7))
(define int2 (make-interval 0 5))

(check-equal? (radius-interval int1) 4)
(check-equal? (radius-interval int2) 5)
(check-equal? (radius-interval (sub-interval int1 int2)) 9)
