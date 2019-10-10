#lang sicp

(define (square-list items)
  (if (null? items)
    nil
    (cons (square (car items)) (square-list (cdr items)))))

(define (square-list-map items)
  (map square items))

(define (square x) (* x x))