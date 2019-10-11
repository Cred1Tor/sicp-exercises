#lang sicp

(#%require "33.rkt")
(#%require rackunit)

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
    nil
    (cons (accumulate op init (accumulate cons nil (map car seqs)))
	  (accumulate-n op init (accumulate cons nil (map cdr seqs))))))

(define s (list (list 1 2 3)
		(list 4 5 6)
		(list 7 8 9)
		(list 10 11 12)))

(check-equal? (accumulate-n + 0 s) (list 22 26 30))
