#lang sicp

(#%require "07.rkt")
(#%require rackunit)
(#%provide sub-interval)

(define (sub-interval a b)
  (make-interval (- (lower-bound a)
		    (upper-bound b))
		 (- (upper-bound a)
		    (lower-bound b))))

(define int1 (make-interval 3 5))
(define int2 (make-interval 4 7))
(define int3 (make-interval -3 2))
(define sub1 (sub-interval int1 int2))
(define sub2 (sub-interval int1 int3))

(check-equal? (lower-bound sub1) -4)
(check-equal? (upper-bound sub1) 1)
(check-equal? (lower-bound sub2) 1)
(check-equal? (upper-bound sub2) 8)
