#lang sicp

(define (type-tag datum)
  (cond [(number? datum) `scheme-number]
	[(pair? datum) (car datum)]
	[else (error "Incorrectly tagged datum -- TYPE-TAG" datum)]))

(define (attach-tag type-tag contents)
  (if (eq? type-tag `scheme-number)
    contents
    (cons type-tag contents)))

(define (contents datum)
  (cond [(number? datum) datum]
	[(pair? datum) (cdr datum)]
	[else (error "Incorrectly tagged datum -- CONTENTS" datum)]))
