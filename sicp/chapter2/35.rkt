#lang sicp

(#%require "33.rkt")
(#%require rackunit)

(define (count-leaves t)
  (accumulate (lambda (x y) (+ x y))
	      0
	      (map (lambda (x) 1)
		   (enumerate-tree t))))

(define (enumerate-tree tree)
    (cond ((null? tree) nil)
	          ((not (pair? tree)) (list tree))
		          (else (append (enumerate-tree (car tree))
					                      (enumerate-tree (cdr tree))))))


(check-equal? (count-leaves (list 1 2 (list 3 (list 4 5)) (list 6 (list 7 8) 9))) 9)
