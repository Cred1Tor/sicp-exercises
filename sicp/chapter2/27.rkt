#lang sicp

(define (deep-reverse items)
  (define (iter items acc)
    (cond [(null? items) acc]
	  [(not (pair? items)) items]
          [else (iter (cdr items) (cons (iter (car items) nil) acc))]))
  (iter items nil))

(deep-reverse (list (list 1 2) (list 3 4)))
(define x (list (list (list 1 3 (list 4 5) (list 6 7)) 8 9) 10 (list 11)))
x
(deep-reverse x)
