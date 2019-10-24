(define (invert p)
  (let ((new-term-list (map (lambda (term)
			      (make-term (order term)
					 (- (coeff term))))
			    (term-list p))))
    (make-poly (variable p) new-term-list)))

(define (sub-poly p1 p2)
  (add-poly p1 (invert p2)))

(put 'sub '(polynomial polynomial)
     (lambda (p1 p2) (tag (sub-poly p1 p2))))
