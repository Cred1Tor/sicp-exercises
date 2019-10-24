#lang sicp

(define (=zero? p)
  (empty-termlist? (term-list p)))

(put `=zero? `(polynomial) =zero?)
