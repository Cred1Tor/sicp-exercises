#lang sicp

(#%require "02.rkt")

(define (make-rect start-point width height)
  (cons start-point (cons width height)))

(define (width-rect rect)
  (car (cdr rect)))

(define (height-rect rect)
  (cdr (cdr rect)))

(define (point3-rect rect)
  (car rect))

(define (point1-rect rect)
  (make-point (+ (x-point (point3-rect rect))
		 (width-rect rect))
	      (+ (y-point (point3-rect rect))
		 (height-rect rect))))

(define (point2-rect rect)
  (make-point (x-point (point3-rect rect))
	      (+ (y-point (point3-rect rect))
		 (height-rect rect))))

(define (point4-rect rect)
  (make-point (+ (x-point (point3-rect rect))
		 (width-rect rect))
	      (y-point (point3-rect rect))))

(define (perimeter-rect rect)
  (* (+ (width-rect rect)
	(height-rect rect))
     2))

(define (square-rect rect) (* (width-rect rect) (height-rect rect)))

(define start-point (make-point 0 0))

(define rect (make-rect start-point 3 4))

(square-rect rect)
