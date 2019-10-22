#lang sicp

(#%provide (all-defined))

(define (scheme-number->rational n)
  (make-rational (contents n) 1))

(define (rational->real n)
  (make-real (/ (numer n) (denom n)))) ; implementation of real number structure is unclear

(define (real->complex n)
  (make-complex-from-real-imag (contents n) 0))

(define (raise n)
  (let ((type (type-tag n)))
    (cond [(eq? type 'scheme-number) (scheme-number->rational n)]
	  [(eq? type 'rational) (rational->real n)]
	  [(eq? type 'real) (real->complex n)]
	  [else (error "Cannot raise number, invalid type -- RAISE" type)])))
