#lang sicp

(#%require rackunit)

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one (lambda (f) (lambda (x) (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

(define (add a b)
  (lambda (f) (lambda (x) ((a f) ((b f) x)))))

(define (inc x) (+ x 1))

(define four (add two two))

(define eight (add four four))

(define nine (add eight one))

(define seventeen (add eight nine))

(define twenty-one (add seventeen (add four zero)))

(check-equal? ((twenty-one inc) 0) 21)


; (add-1 zero)
; (lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x))))
; (lambda (f) (lambda (x) (f ((lambda (x) x) x))))
; (lambda (f) (lambda (x) (f x))) - one
 
