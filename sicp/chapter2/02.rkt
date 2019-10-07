#lang sicp

(define (make-point x y) (cons x y))

(define (x-point point) (car point))

(define (y-point point) (cdr point))

(define (make-segment point1 point2) (cons point1 point2))

(define (start-segment segment) (car segment))

(define (end-segment segment) (cdr segment))

(define (midpoint-segment segment)
  (let ((point-a (start-segment segment))
	(point-b (end-segment segment)))
    (make-point (/ (+ (x-point point-a)
		      (x-point point-b))
		   2)
		(/ (+ (y-point point-a)
		      (y-point point-b))
		   2))))

(define a (make-point 1 2))
(define b (make-point 5 8))
(define seg (make-segment a b))
(midpoint-segment seg)
