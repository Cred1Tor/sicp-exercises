#lang sicp

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (define (try-to-convert rest-of-types)
	    (if (null? rest-of-types)
	      (error "no method for these types"))
	    (let ((new-type-tags (map (lambda (tag)
					(if (get-coercion tag (car rest-of-types))
					  (car rest-of-types)
					  tag))
				      type-tags)))
	      (let ((new-proc (get op new-type-tags)))
		(if new-proc
		  (apply-generic op (map (lambda (arg)
					   (let ((conversion (get-coercion (type-tag arg) (car rest-of-types))))
					     (if conversion
					       (conversion arg)
					       arg)))
					 args))
		  (try-to-convert (cdr rest-of-types))))))
	  (try-to-convert type-tags)))))
