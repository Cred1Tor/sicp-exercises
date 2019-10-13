#lang sicp

(#%require rackunit)

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (make-frame2 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame f) (car f)) ; same for both

(define (edge1-frame f) (cadr f)) ; same for both

(define (edge2-frame f) (caddr f))

(define (edge2-frame2 f) (cddr f))

(check-equal? (edge2-frame (make-frame 1 2 3)) 3)

(check-equal? (edge2-frame2 (make-frame2 1 2 3)) 3)
