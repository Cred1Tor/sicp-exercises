#lang sicp

(#%require "07.rkt")
(#%require rackunit)

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (make-center-width c (/ (* c p) 100)))

(define (percent i)
  (* (/ (width i) (center i))
     100))

(define test (make-center-percent 150 4))

(check-equal? (percent test) 4)
(check-equal? (center test) 150)
