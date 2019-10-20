#lang sicp

; scheme-number-package
(put `equ? `(scheme-number scheme-number)
     (lambda (x y) (= x y)))

; rational package
(define (equ? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

(put `equ? `(rational rational) equ?)

; complex package
(put `equ? `(complex complex) equ?)

; rectantular package
(define (equ? x y)
  (and (= (real-part x) (real-part y))
       (= (imag-part x) (imag-part y))))

(put `equ? `(rectangular rectangular) equ?)

; polar package
(define (equ? x y)
  (and (= (magnitude x) (magnitude y))
       (= (angle x) (angle y))))

(put `equ? `(polar polar) equ?)

; exterior
(define (equ? x y)
  (apply-generic `equ? x y))
