#lang sicp 

(#%require rackunit)

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? last-guess new-guess)
  (< (abs (/ (- last-guess new-guess) new-guess)) 0.0001))

(define (sqrt-iter guess x)
  (define new-guess (improve guess x))
  (if (good-enough? guess new-guess)
    	new-guess
	(sqrt-iter new-guess x)))

(sqrt-iter 1.0 9)
(sqrt-iter 1.0 25)
(sqrt-iter 1.0 100)
(sqrt-iter 1.0 1000000000000)
(sqrt-iter 1.0 0.000004)
