#lang sicp

(define (reverse items)
  (define (reverse-iter items acc)
    (if (null? items)
      acc
      (reverse-iter (cdr items) (cons (car items) acc))))
  (reverse-iter items nil))

(reverse (list 1 4 9 16 25))
