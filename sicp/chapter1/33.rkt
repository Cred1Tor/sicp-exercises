#lang sicp

(#%require rackunit)

(define (filtered-accumulate combiner null-value term a next b predicate)
  (define (iter a acc)
    (if (> a b)
      acc
      (iter (next a) (if (predicate a)
		       (combiner acc (term a))
		       acc))))
  (iter a null-value))

(define (square x) (* x x))

(define (smallest-divisor n)
    (find-divisor n 2))

(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
	          ((divides? test-divisor n) test-divisor)
		          (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
    (= (remainder b a) 0))

(define (prime? n)
    (= n (smallest-divisor n)))

(define (inc x) (+ x 1))

(define (term-a a b)
  (filtered-accumulate + 0 square a inc b prime?))

(define (gcd a b)
    (if (= b 0)
            a
	          (gcd b (remainder a b))))

(define (prime-to-n? i n)
  (= (gcd i n) 1))

(define (idendity x) x)

(define (term-b n)
  (define (predicate x)
    (prime-to-n? x n))
  (filtered-accumulate * 1 identity 1 inc n predicate))

(check-equal? (term-a 2 5) 38)
(check-equal? (term-b 10) 189)
