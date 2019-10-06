#lang sicp

(define (sqrt-good-enough? x)
  (lambda (y)
      (< (abs (- (square y) x)) 0.001)))

(define (square x) (* x x))

(define (sqrt-improve x)
  (lambda (y)
	  (average y (/ x y))))

(define (average a b) (/ (+ a b) 2))

(define (iterative-improve good-enough? improve)
  (lambda (x)
    (define (iter n)
    	(if (good-enough? n)
    	  n
    	  (iter (improve n))))
  (iter x)))

(define (sqrt-iter x)
  ((iterative-improve (sqrt-good-enough? x) (sqrt-improve x))
   1.0))

(sqrt-iter 9)
