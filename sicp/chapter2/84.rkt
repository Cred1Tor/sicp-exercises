#lang sicp

(#%require "83.rkt")

(define (equate-type a1 a2)
  (let ((type1 (type-tag a1))
	(type2 (type-tag a2)))
    (if (eq? type1 type2)
      (list a1 a2)
	(define (raise-until-type arg type)
	  (let ((type-arg (type-tag arg))
	    	(raise-arg (get `raise type-arg)))
	      (if (eq? type-arg type) arg
	        (if (not raise-arg) #f
		  (raise-until-type (raise-arg arg) type)))))
	(if (raise-until-type a1 type2)
	  (list (raise-until-type a1 type2) a2)
	  (if (raise-until-type a2 type1)
	    (list a1 (raise-until-type a2 type1))
	    #f)))))

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (= (length args) 2)
	    (let ((new-args (apply equate-type args)))
	      (if new-args
                 (apply-generic op new-args)
	  	  (error "No method for these types"
                                (list op type-tags)))))))))
