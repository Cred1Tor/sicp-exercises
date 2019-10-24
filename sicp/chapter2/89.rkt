(define (adjoin-term term term-list)
    (cons term term-list))

(define (the-empty-termlist) '())

(define (first-term-order term-list)
  (- length(term-list) 1))

(define (first-term-coeff term-list) (car term-list))

(define (rest-terms term-list) (cdr term-list))

(define (empty-termlist? term-list)
  (cond [(null? term-list) #t]
	[(not (=zero? (first-term-coeff term-list))) #f]
	[else (empty-termlist? (rest-terms term-list))]))
