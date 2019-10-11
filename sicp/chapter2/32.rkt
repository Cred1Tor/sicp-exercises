#lang sicp

(define (subsets s)
  (if (null? s)
    (list nil)
    (let ((rest (subsets (cdr s))))
      (append rest (map (lambda (x) (cons (car s) x)) rest))))) ; similiar to coin problem

(subsets (list 1 2 3))
