#lang sicp

(#%require "38.rkt")

(define (reverse1 sequence)
  (fold-right (lambda (x y) (append y (list x)))
	      nil
	      sequence))

(define (reverse2 sequence)
  (fold-left (lambda (x y) (cons y x))
	     nil
	     sequence))

(reverse1 (list 1 2 3 4 5))
(reverse2 (list 1 2 3 4 5))
