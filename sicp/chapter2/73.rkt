#lang sicp

(define (deriv exp var)
     (cond ((number? exp) 0)
	            ((variable? exp) (if (same-variable? exp var) 1 0))
		             (else ((get 'deriv (operator exp)) (operands exp)
								                                            var))))
(define (operator exp) (car exp))

(define (operands exp) (cdr exp))

(define (deriv-sum operands var)
  (make-sum (map (lambda (x) (deriv x var))
		 operands)))

(define (make-sum . x) (cons `+ x))

(define (deriv-product operands var)
  (make-sum (map (lambda (x)
		   (make-product (map (lambda (y)
					(if (eq? x y) (deriv x var)
						      y))
						operands)))
		 operands)))

(define (make-product . x) (cons `* x))

(put `deriv `+ deriv-sum)

(put `deriv `* deriv-product)

(define (deriv-exp operands var)
  (let ((base (car operands))
	(exponent (cadr operands)))
    (make-product (list exponent
			(make-exponentiation base (- exponent 1))
			(deriv base var)))))

(define (make-exponentiation base exponent) (list `** base exponent))

(put `deriv `** deriv-exp)
