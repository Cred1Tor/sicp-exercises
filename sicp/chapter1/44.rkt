#lang sicp

(#%require "43.rkt")

(define (smooth f)
  (lambda (x)
    (average3 (f x)
	      (f (+ x dx))
	      (f (- x dx)))))

(define dx 0.00001)

(define (average3 a b c)
  (/ (+ a b c) 3))

(define (square x) (* x x))

((smooth square) 2)
(((repeated smooth 5) square) 2)
