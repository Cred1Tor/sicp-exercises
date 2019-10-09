#lang sicp

(#%require "07.rkt")
(#%require rackunit)
(#%provide make-center-width center width make-center-percent percent)

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (make-center-width c (/ (* c p) 100.0)))

(define (percent i)
  (* (/ (width i) (center i))
     100.0))

(define test (make-center-percent 150 4))

(check-equal? (percent test) 4.0)
(check-equal? (center test) 150.0)
