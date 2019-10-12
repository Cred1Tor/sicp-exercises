#lang sicp

(#%provide (all-defined))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
	(accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
    nil
    (cons low (enumerate-interval (+ low 1) high))))

(define (unique-triples n)
  (flatmap (lambda (i)
	     (flatmap (lambda (j)
			(map (lambda (k) (list i j k))
			     (enumerate-interval 1 (- j 1))))
		      (enumerate-interval 1 (- i 1))))
	     (enumerate-interval 1 n)))

(define (triple-equality triple x)
  (= (accumulate + 0 triple) x))

(define (sum-triples n s)
  (filter (lambda (x) (triple-equality x s))
	  (unique-triples n)))

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
	((predicate (car sequence))
	 (cons (car sequence)
	       (filter predicate (cdr sequence))))
	(else (filter predicate (cdr sequence)))))

(sum-triples 20 50)
