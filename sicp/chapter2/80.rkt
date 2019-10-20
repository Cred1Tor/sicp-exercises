#lang sicp

; scheme-number-package
(put `=zero? `(scheme-number)
     (lambda (x) (= x 0)))

; rational package
(define (=zero? x)
  (= (numer x) 0))

(put `=zero? `(rational) =zero?)

; complex package
(put `=zero? `(complex) =zero?)

; rectantular package
(define (=zero? x)
  (and (= (real-part x) 0)
       (= (imag-part x) 0)))

(put `=zero? `(rectangular) =zero?)

; polar package
(define (=zero? x)
  (= (magnitude x) 0))

(put `=zero? `(polar) =zero?)

; exterior
(define (=zero? x)
  (apply-generic `zero? x))
