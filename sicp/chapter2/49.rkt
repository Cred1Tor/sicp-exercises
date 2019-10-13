#lang sicp

(define frame-outline (segments->painter (list (cons (cons 0 0) (cons 0 1))
						 (cons (cons 0 0) (cons 1 0))
						 (cons (cons 1 0) (cons 1 1))
						 (cons (cons 0 1) (cons 1 1)))))

(define cross (segments->painter (list (cons (cons 0 0) (cons 1 1))
				       (cons (cons 0 1) (cons 1 0)))))

(define diamond (segments->painter (list (cons (cons 0.5 0) (cons 1 0.5))
					 (cons (cons 0.5 0) (cons 0 0.5))
					 (cons (cons 0 0.5) (cons 0.5 1))
					 (cons (cons 0.5 1) (cons 1 0.5)))))
