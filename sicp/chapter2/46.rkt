#lang sicp

(#%require rackunit)

(#%provide (all-defined))

(define (make-vect x y) (cons x y))

(define (xcor-vect v) (car v))

(define (ycor-vect v) (cdr v))

(define (add-vect x y)
  (make-vect (+ (xcor-vect x) (xcor-vect y))
	     (+ (ycor-vect x) (ycor-vect y))))

(define (sub-vect x y)
  (make-vect (- (xcor-vect x) (xcor-vect y))
	     (- (ycor-vect x) (ycor-vect y))))

(define (scale-vect s v)
  (make-vect (* (xcor-vect v) s)
	     (* (ycor-vect v) s)))

(check-equal? (add-vect (make-vect 1 2)
		  (make-vect -3 8))
	(make-vect -2 10))

(check-equal? (scale-vect -2 (make-vect 1 -5))
	(make-vect -2 10))
