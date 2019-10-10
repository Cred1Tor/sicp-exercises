#lang sicp

(define (same-parity x . y)
  (let ((x-parity (even? x)))
    (define (recur x . y)
      (cond [(null? y) (cons x nil)]
	    [(equal? x-parity (even? x))
	     (cons x (apply recur (car y) (cdr y)))]
	    [else (apply recur (car y) (cdr y))]))
    (apply recur x y)))

(same-parity 1 2 3 4 5 6 7)

  
