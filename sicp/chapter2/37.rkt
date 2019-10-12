#lang sicp

(#%require "33.rkt")
(#%require "36.rkt")

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v))
       m))

(define m (list (list 1 2 3) (list 4 5 6)))
(define v (list 7 8 9))
(matrix-*-vector m v)

(define (transpose mat)
  (accumulate-n cons nil mat))

(transpose m)

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) (matrix-*-vector cols x))
	 m)))

(define n (list (list 7 8) (list 9 10) (list 11 12)))

(matrix-*-matrix m n)
