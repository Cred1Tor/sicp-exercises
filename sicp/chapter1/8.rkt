#lang sicp

(#%require rackunit)

(define (improve guess x)
  (/ (+ (/ x
	   (* guess guess))
	(* 2 guess))
     3))

(define (good-enough? last-guess new-guess)
  (< (abs (/ (- last-guess new-guess) new-guess)) 0.0001))

(define (cbrt-iter guess x)
  (define new-guess (improve guess x))
    (if (good-enough? guess new-guess)
          	new-guess
			(cbrt-iter new-guess x)))

(cbrt-iter 1.0 9)
(cbrt-iter 1.0 125)
(cbrt-iter 1.0 1000)
