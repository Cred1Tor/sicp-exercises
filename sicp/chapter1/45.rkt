#lang sicp

(#%require "43.rkt")

(define (fast-expt b n)
    (cond ((= n 0) 1)
	          ((even? n) (square (fast-expt b (/ n 2))))
		          (else (* b (fast-expt b (- n 1))))))

(define tolerance 0.00001)

(define (square x) (* x x))

(define (fixed-point f first-guess)
    (define (close-enough? v1 v2)
          (< (abs (- v1 v2)) tolerance))
      (define (try guess)
	    (let ((next (f guess)))
	            (if (close-enough? guess next)
		                next
				          (try next))))
        (try first-guess))

(define (average-damp f)
    (lambda (x) (average x (f x))))

(define (average a b) (/ (+ a b) 2))

(define (root x n k)
  (fixed-point ((repeated average-damp k) (lambda (y) (/ x
					    (fast-expt y (- n 1)))))
	       1.0))

(root 9 2 1)
(root 16 2 1)
(root 27 3 1)
(root 16 4 2)
(root 32 5 2)
(root 64 6 2)
(root 128 7 2)
(root 256 8 3)
(root 512 9 3)
(root 1024 10 3)
(root 2048 11 3)
(root 4096 12 3)
(root 100 13 3)
(root 100 14 3)
(root 100 15 3)
(root 1000 16 3)
(root 1000 17 3)
(root 1000 18 3)
(root 1000 19 3)
(root 100000 64 4)
(root 10000 259 4)
