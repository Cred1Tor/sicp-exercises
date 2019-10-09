#lang sicp

(#%require "07.rkt")

(define (mul-interval x y)
  (let ((x-low (lower-bound x))
	(x-high (upper-bound x))
	(y-low (lower-bound y))
	(y-high (upper-bound y)))
    (cond [(and (> x-low 0)
		(> x-high 0)
		(> y-low 0)
		(> y-high 0) (make-interval (* x-low y-low) (* x-high y-high)))]
    	  [(and (< x-low 0)
		(> x-high 0)
		(> y-low 0)
		(> y-high 0) (make-interval (* x-low y-high) (* x-high y-high)))]
    	  [(and (< x-low 0)
		(< x-high 0)
		(> y-low 0)
		(> y-high 0) (make-interval (* x-low y-high) (* x-high y-low)))]
    	  [(and (< x-low 0)
		(< x-high 0)
		(< y-low 0)
		(> y-high 0) (make-interval (* x-low y-high) (* x-low y-low)))]
    	  [(and (< x-low 0)
		(< x-high 0)
		(< y-low 0)
		(< y-high 0) (make-interval (* x-high y-high) (* x-low y-low)))]
    	  [(and (> x-low 0)
		(> x-high 0)
		(< y-low 0)
		(> y-high 0) (make-interval (* x-high y-low) (* x-high y-high)))]
    	  [(and (> x-low 0)
		(> x-high 0)
		(< y-low 0)
		(< y-high 0) (make-interval (* x-high y-low) (* x-low y-high)))]
    	  [(and (< x-low 0)
		(> x-high 0)
		(< y-low 0)
		(< y-high 0) (make-interval (* x-high y-low) (* x-low y-low)))]
    	  [(and (< x-low 0)
		(> x-high 0)
		(< y-low 0)
		(> y-high 0) (make-interval (min (* x-low y-high) (* x-high y-low))
					    (max (* x-low y-low) (* x-high y-high))))])))
