#lang sicp

(#%require rackunit)

(define (cont-frac-iter n d k)
  (define (iter i acc)
    (if (< i 1)
      acc
      (iter (- i 1) (/ (n i)
		       (+ (d i)
			  acc)))))
  (iter k 0))

(define (one i) 1.0)

(define (euler i)
  (let ((i-plus-one (+ i 1)))
    (cond [(= (remainder i-plus-one 3) 0) (* (/ i-plus-one 3) 2)]
	  [else 1])))

(check-equal? (euler 1) 1)
(check-equal? (euler 2) 2)
(check-equal? (euler 3) 1)
(check-equal? (euler 4) 1)
(check-equal? (euler 5) 4)
(check-equal? (euler 6) 1)
(check-equal? (euler 7) 1)

(+ (cont-frac-iter one euler 100)
   2)
