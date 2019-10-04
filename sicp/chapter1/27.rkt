#lang sicp

(define (square a) (* a a))

(define (expmod base exp m)
    (cond ((= exp 0) 1)
	  ((even? exp)
	    (remainder (square (expmod base (/ exp 2) m))
		       m))
	  (else
	    (remainder (* base (expmod base (- exp 1) m))
		       m))))        

(define (fermat-test-all n)
    (define (iter a)
          (cond ((>= a n) true)
	    	((not (= (expmod a n n) a)) false)
		(else (iter (+ a 1)))))
    (iter 2))

(define (fermat-report n)
    (newline)
    (display n)
    (display " *** ")
    (if (fermat-test-all n)
      (display "fermat test passed")
      (display "fermat test failed")))

(fermat-report 13)
(fermat-report 63)
(fermat-report 561)
(fermat-report 1105)
(fermat-report 1729)
(fermat-report 2465)
(fermat-report 2821)
(fermat-report 6601)

