#lang sicp

(#%require rackunit)

(define (sum-of-squares a b)
    (+ (* a a) (* b b)))

(define (min2 a b)
    (if (> a b) b a))

(define (min3 a b c)
    (min2 a (min2 b c)))

(define (f x y z)
    (cond ([= (min3 x y z) x] (sum-of-squares y z))
	          ([= (min3 x y z) y] (sum-of-squares x z))
		          ([= (min3 x y z) z] (sum-of-squares x y))))

(check-equal? (f 1 2 3) 13)
(check-equal? (f -1 3 4) 25)
(check-equal? (f -2 0 -7) 4)
(check-equal? (f 3 3 4) 25)
