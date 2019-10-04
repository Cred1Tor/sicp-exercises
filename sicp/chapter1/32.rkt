#lang sicp

(#%require rackunit)

(define (accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a)
	      (accumulate combiner null-value term (next a) next b))))

(define (accum-iter combiner null-value term a next b)
  (define (iter a acc)
    (if (> a b)
      acc
      (iter (next a) (combiner acc (term a)))))
  (iter a null-value))

(define (identity x) x)

(define (inc x) (+ x 1))

(define (factorial n)
  (accumulate * 1 identity 1 inc n))

(define (factorial-iter n)
  (accum-iter * 1 identity 1 inc n))

(define (sum a b)
  (accumulate + 0 identity a inc b))

(define (sum-iter a b)
  (accum-iter + 0 identity a inc b))

(check-equal? (factorial 7) 5040)
(check-equal? (factorial-iter 7) 5040)
(check-equal? (sum 10 12) 33)
(check-equal? (sum-iter 100 104) 510)
