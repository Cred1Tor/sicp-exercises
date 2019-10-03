#lang sicp

(#%require rackunit)

(define (fast-multi a b)
  (define (iter a b acc)
    (if (= b 0)
      acc
      (if (even? b)
	(iter (double a) (halve b) acc)
	(iter a (- b 1) (+ acc a)))))
  (iter a b 0))

(define (double a) (* a 2))
(define (halve a) (/ a 2))

(check-equal? (fast-multi 0 5) 0)
(check-equal? (fast-multi 3 5) 15)
(check-equal? (fast-multi 3 0) 0)
(check-equal? (fast-multi 6 4) 24)
(check-equal? (fast-multi 7 8) 56)
(check-equal? (fast-multi 10 50) 500)
