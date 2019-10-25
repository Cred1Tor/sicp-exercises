(define (install-rational-package)
  ;; internal procedures
  (define (numer x) (car x))
  (define (denom x) (cdr x))
  (define (make-rat n d)
  (let ((g (gcd-gen n d)))
    (cons (div n g) (div d g))))
  (define (add-rat x y)
    (make-rat (add (mul (numer x) (denom y))
                 (mul (numer y) (denom x)))
              (mul (denom x) (denom y))))
  (define (sub-rat x y)
    (make-rat (sub (mul (numer x) (denom y))
                 (mul (numer y) (denom x)))
              (mul (denom x) (denom y))))
  (define (mul-rat x y)
    (make-rat (mul (numer x) (numer y))
              (mul (denom x) (denom y))))
  (define (div-rat x y)
    (make-rat (mul (numer x) (denom y))
              (mul (denom x) (numer y))))
  ;; interface to rest of the system
  (define (tag x) (attach-tag 'rational x))
  (put 'add '(rational rational)
       (lambda (x y) (tag (add-rat x y))))
  (put 'sub '(rational rational)
       (lambda (x y) (tag (sub-rat x y))))
  (put 'mul '(rational rational)
       (lambda (x y) (tag (mul-rat x y))))
  (put 'div '(rational rational)
       (lambda (x y) (tag (div-rat x y))))

  (put 'make 'rational
       (lambda (n d) (tag (make-rat n d))))
  'done)

; poly-package
(define (gcd-terms a b)
  (if (empty-termlist? b)
    a
    (gcd-terms b (remainder-terms a b))))

(define (remainder-terms p1 p2)
  (cadr (div-terms p1 p2)))

(define (gcd-polys p1 p2)
  (let ((v1 (variable p1))
	(v2 (variable p2))
	(l1 (term-list p1))
	(l2 (term-list p2)))
    (if (same-variable? v1 v2)
      (make-poly v1 (gcd-terms l1 l2))
      (error "different variables -- GCD-POLYS" (list v1 v2)))))

(define (tag p) (attach-tag 'polynomial p))

(put 'greatest-common-divisor '(polynomial polynomial)
     (lambda (p1 p2) (tag (gcd-polys p1 p2))))

; scheme-number-package
(put 'greatest-common-divisor '(scheme-number scheme-number) gcd)
