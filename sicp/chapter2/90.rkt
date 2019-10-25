; sparse-terms-package
(define (adjoin-term term term-list)
  (if (=zero? (coeff term))
      term-list
      (cons term term-list)))

(define (the-empty-termlist) '())
(define (first-term term-list) (car term-list))
(define (rest-terms term-list) (cdr term-list))
(define (empty-termlist? term-list) (null? term-list))

(define (make-term order coeff) (list order coeff))
(define (order term) (car term))
(define (coeff term) (cadr term)

(define (add-terms L1 L2)
  (cond ((empty-termlist? L1) L2)
        ((empty-termlist? L2) L1)
        (else
         (let ((t1 (first-term L1)) (t2 (first-term L2)))
           (cond ((> (order t1) (order t2))
                  (adjoin-term
                   t1 (add-terms (rest-terms L1) L2)))
                 ((< (order t1) (order t2))
                  (adjoin-term
                   t2 (add-terms L1 (rest-terms L2))))
                 (else
                  (adjoin-term
                   (make-term (order t1)
                              (add (coeff t1) (coeff t2)))
                   (add-terms (rest-terms L1)
                              (rest-terms L2)))))))))

(define (mul-terms L1 L2)
  (if (empty-termlist? L1)
      (the-empty-termlist)
      (add-terms (mul-term-by-all-terms (first-term L1) L2)
                 (mul-terms (rest-terms L1) L2))))

(define (mul-term-by-all-terms t1 L)
  (if (empty-termlist? L)
      (the-empty-termlist)
      (let ((t2 (first-term L)))
        (adjoin-term
         (make-term (+ (order t1) (order t2))
                    (mul (coeff t1) (coeff t2)))
         (mul-term-by-all-terms t1 (rest-terms L))))))

(define (tag l) (attach-tag 'sparse l))

(put 'add-terms '(sparse sparse)
     (lambda (l1 l2) (tag (add-terms l1 l2))))
(put 'mul-terms '(sparse sparse)
     (lambda (l1 l2) (tag (mul-terms l1 l2))))

; dense-terms-package
(define (adjoin-term term term-list)
  (let ((next-order (+ (order (first-term term-list))
		       1)))
    (if (= (order term) next-order)
      (cons (coeff term) term-list)
      (cons 0 term-list))))

(define (the-empty-termlist) '())

(define (first-term term-list) 
  (make-term (- (length term-list) 1)
	     (car term-list)))

(define (rest-terms term-list) (cdr term-list))
(define (make-term order coeff) (list order coeff))
(define (order term) (car term))
(define (coeff term) (cadr term))

(define (empty-termlist? term-list)
  (cond [(null? term-list) #t]
	[(not (=zero? (first-term-coeff term-list))) #f]
	[else (empty-termlist? (rest-terms term-list))]))

(define (add-terms L1 L2)
  (cond ((empty-termlist? L1) L2)
        ((empty-termlist? L2) L1)
        (else
         (let ((t1 (first-term L1)) (t2 (first-term L2)))
           (cond ((> (order t1) (order t2))
                  (adjoin-term
                   t1 (add-terms (rest-terms L1) L2)))
                 ((< (order t1) (order t2))
                  (adjoin-term
                   t2 (add-terms L1 (rest-terms L2))))
                 (else
                  (adjoin-term
                   (make-term (order t1)
                              (add (coeff t1) (coeff t2)))
                   (add-terms (rest-terms L1)
                              (rest-terms L2)))))))))

(define (mul-terms L1 L2)
  (if (empty-termlist? L1)
      (the-empty-termlist)
      (add-terms (mul-term-by-all-terms (first-term L1) L2)
                 (mul-terms (rest-terms L1) L2))))

(define (mul-term-by-all-terms t1 L)
  (if (empty-termlist? L)
      (the-empty-termlist)
      (let ((t2 (first-term L)))
        (adjoin-term
         (make-term (+ (order t1) (order t2))
                    (mul (coeff t1) (coeff t2)))
         (mul-term-by-all-terms t1 (rest-terms L))))))

(define (tag l) (attach-tag 'dense l))

(put 'add-terms '(dense dense)
     (lambda (l1 l2) (tag (add-terms l1 l2))))
(put 'mul-terms '(dense dense)
     (lambda (l1 l2) (tag (mul-terms l1 l2))))

; general-terms-package
(define (add-terms l1 l2)
  (apply-generic 'add-terms l1 l2))

(define (mul-terms l1 l2)
  (apply-generic 'mul-terms l1 l2))
