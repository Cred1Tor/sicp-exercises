#lang sicp

; complex-package
(put 'project 'complex
     (lambda (x) (make-real-number (real-part x))))

; real-package
(put 'project 'real
     (lambda (x)
       (let ((rat (rationalize (inexact->exact (contents x)) 1/100)))
	 (make-rational (numerator rat) (denominator rat)))))

; rational-package
(put 'project 'rational
     (lambda (x) (round (/ (numer x) (denom x)))))

; exterior

(define (project x)
  (let ((proc (get 'project (type-tag x))))
    (if proc
      (proc x)
      #f)))

(define (drop x)
  (if (project x)
    (if (equ? (raise (project x)) x)
      (drop (project x))
      x)
    x))


(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (drop (apply proc (map contents args)))
          (if (= (length args) 2)
	    (let ((new-args (apply equate-type args)))
	      (if new-args
                 (apply-generic op new-args)
	  	  (error "No method for these types"
                                (list op type-tags)))))))))
