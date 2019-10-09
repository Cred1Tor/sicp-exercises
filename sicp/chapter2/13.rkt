#lang sicp

(#%require "12.rkt")
(#%require "11.rkt")

(define a (make-center-percent 10 1))
(define b (make-center-percent 300 0.5))
(define ab (mul-interval a b))
(percent ab) ; percent of composition is about the sum of percents of the multipliers
