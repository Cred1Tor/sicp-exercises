#lang sicp

(#%require "07.rkt")
(#%provide div-interval mul-interval)

(define (div-interval x y)
  (if (and (>= (upper-bound y) 0)
	   (<= (lower-bound y) 0))
    (error "интервал проходит через 0 - div-interval" y)
    (mul-interval x
		  (make-interval (/ 1.0 (upper-bound y))
				 (/ 1.0 (lower-bound y))))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
	(p2 (* (lower-bound x) (upper-bound y)))
	(p3 (* (upper-bound x) (lower-bound y)))
	(p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
		   (max p1 p2 p3 p4))))

(define int1 (make-interval 2 5))
(define int2 (make-interval 1 6))
(define int3 (make-interval -2 3))

; (div-interval int1 int2)
; (div-interval int1 int3)
