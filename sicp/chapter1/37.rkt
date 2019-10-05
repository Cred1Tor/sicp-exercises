#lang sicp

(define (cont-frac n d k)
  (define (iter i)
    (if (> i k)
      0
      (/ (n i)
	 (+ (d i)
	    (iter (+ i 1))))))
  (iter 1))

(define (cont-frac-iter n d k)
  (define (iter i acc)
    (if (< i 1)
      acc
      (iter (- i 1) (/ (n i)
		       (+ (d i)
			  acc)))))
  (iter k 0))

(define (one i) 1.0)

(cont-frac one one 12)
(cont-frac-iter one one 12)
