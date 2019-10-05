#lang sicp

(define (cont-frac-iter n d k)
  (define (iter i acc)
    (if (< i 1)
      acc
      (iter (- i 1) (/ (n i)
		       (+ (d i)
			  acc)))))
  (iter k 0))

(define (minus-square-except-one i x)
  (if (= i 1)
    x
    (- (* x x))))

(define (odd-seq i)
  (- (* i 2)
     1))

(define (tan-cf x k)
  (define (n i)
    (minus-square-except-one i x))
  (cont-frac-iter n odd-seq k))

(define pi 3.14159265359)

(tan-cf pi 100)
(tan-cf 0 100)
(tan-cf (/ pi 3) 100)
(tan-cf (/ pi 4) 100)
(tan-cf (/ pi 6) 100)

