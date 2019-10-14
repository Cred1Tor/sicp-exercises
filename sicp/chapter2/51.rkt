#lang sicp

(define (below1 painter1 painter2)
  (let ((paint-bottom
	  (transform-painter painter1
			     (make-vect 0.0 0.0)
			     (make-vect 1.0 0.0)
			     (make-vect 0.0 0.5)))
	(paint-top
	  (transform-painter painter2
			     (make-vect 0.0 0.5)
			     (make-vect 1.0 0.5)
			     (make-vect 0.0 1.0))))
    (lambda (frame)
      (paint-bottom frame)
      (paint-top frame))))

(define (below2 painter1 painter2)
  (rotate270 (beside (rotate90 painter2)
		     (rotate90 painter1))))

