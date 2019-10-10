#lang sicp

(define (for-each func items)
  (cond [(null? items) true]
    	[else (func (car items))
	      (for-each func (cdr items))]))

(for-each (lambda (x) (newline) (display x))
	  (list 57 321 88))
