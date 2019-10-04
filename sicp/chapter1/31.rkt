#lang sicp

(define (product term a next b)
  (if (> a b)
    1
    (* (term a) 
       (product term (next a) next b))))

(define (inc n) (+ n 1))

(define (inc2 n) (+ n 2))

(define (identity x) x)

(define (factorial n)
  (product identity 1 inc n))

(define (product-iter term a next b)
  (define (iter a acc)
    (if (> a b)
      acc
      (iter (next a) (* acc
			(term a)))))
  (iter a 1))

(define (factorial-iter n)
  (product-iter identity 1 inc n))

(define (wallis n)
  (/ (* (- n 1)
	(+ n 1))
     (* n n)
     1.0))

(define pi
  (* (product-iter wallis 3 inc2 1000)
     4))

(factorial 7)
(factorial-iter 7)
pi
