#lang sicp

(#%require rackunit)

(define (fast-expt b n)
  (define (fast-iter b n a)
    (if (= n 0)
      a
      (if (even? n)
	(fast-iter (* b b) (/ n 2) a)
	(fast-iter b (- n 1) (* a b)))))
  (fast-iter b n 1))

(check-equal? (fast-expt 2 2) 4)
(check-equal? (fast-expt 2 4) 16)
(check-equal? (fast-expt 3 3) 27)
(check-equal? (fast-expt 7 0) 1)
(check-equal? (fast-expt 5 4) 625)

