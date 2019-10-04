#lang sicp

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (integral f a b dx)
    (define (add-dx x) (+ x dx))
    (* (sum f (+ a (/ dx 2)) add-dx b)
       dx))

(define (simpson f a b n)
  (define h (+ (/ (- b a)
	          n)
    	       0.0))
  (define (add-h x) (+ x h))
  (define (iter k x acc)
    (cond [(or (= k 0)
	       (= k n)) (iter (+ k 1) (add-h x) (+ acc (f x)))]
	  [(> k n) acc]
	  [(even? k) (iter (+ k 1) (add-h x) (+ acc (* 2 (f x))))]
	  [(odd? k) (iter (+ k 1) (add-h x) (+ acc (* 4 (f x))))]))
  (* (iter 0 a 0)
     (/ h 3)))

(define (cube x) (* x x x))

(simpson cube 0 1 100)
(simpson cube 0 1 1000)
(integral cube 0 1 0.01)
(integral cube 0 1 0.001)
