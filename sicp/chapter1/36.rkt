#lang sicp

(define tolerance 0.00001)

(define (fixed-point f first-guess)
    (define (close-enough? v1 v2)
          (< (abs (- v1 v2)) tolerance))
      (define (try guess count)
	    (let ((next (f guess)))
	      	(display count)
		(display " * ")
		(display next)
	      	(newline)
	            (if (close-enough? guess next)
		                next
				          (try next (+ 1 count)))))
        (try first-guess 1))

(define (average x y)
  (/ (+ x y)
     2))

(fixed-point (lambda (x)
	       (/ (log 1000)
		  (log x)))
	     2.0) ; 34 steps
(fixed-point (lambda (x)
	       (average x
			(/ (log 1000)
			   (log x))))
	     2.0) ; 9 steps
