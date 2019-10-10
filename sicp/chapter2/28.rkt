#lang sicp

(define (fringe items)
  (define (iter items acc)
    (cond [(null? items) acc]
	  [(not (pair? items)) (cons items acc)]
	  [else (iter (car items) (iter (cdr items) acc))]))
  (iter items nil))

(define x (list (list 1 2) (list 3 4)))

(fringe x)
