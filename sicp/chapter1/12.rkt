#lang sicp

(#%require rackunit)

(define (get-pascal-number n m)
  (if (or (= m 0)
	  (= m n))
    1
    (+ (get-pascal-number (- n 1) (- m 1))
       (get-pascal-number (- n 1) m))))

(check-equal? (get-pascal-number 0 0) 1)
(check-equal? (get-pascal-number 10 0) 1)
(check-equal? (get-pascal-number 7 7) 1)
(check-equal? (get-pascal-number 4 1) 4)
(check-equal? (get-pascal-number 13 6) 1716)
(check-equal? (get-pascal-number 15 7) 6435)
