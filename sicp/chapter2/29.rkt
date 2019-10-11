#lang sicp

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

(define (total-weight mobile)
  (cond [(not (pair? mobile)) mobile]
	[else (+ (total-weight (branch-structure (left-branch mobile)))
		 (total-weight (branch-structure (right-branch mobile))))]))

(define (balanced? mobile)
  (cond [(not (pair? mobile)) #t]
	[else (let ((l1 (branch-length (left-branch mobile)))
		    (l2 (branch-length (right-branch mobile)))
		    (w1 (total-weight (branch-structure (left-branch mobile))))
		    (w2 (total-weight (branch-structure (right-branch mobile)))))
		(and (= (* l1 w1) (* l2 w2))
		     (balanced? (branch-structure (left-branch mobile)))
		     (balanced? (branch-structure (right-branch mobile)))))]))

(define m1 (make-mobile (make-branch 4 6) 
		        (make-branch 5 
				     (make-mobile (make-branch 3 7) 
						  (make-branch 9 8))))) 

(define m2 (make-mobile (make-branch 4 6) 
		        (make-branch 2 
				     (make-mobile (make-branch 5 8) 
						  (make-branch 10 4))))) 

(total-weight m1)
(total-weight m2)
(balanced? m1)
(balanced? m2)
