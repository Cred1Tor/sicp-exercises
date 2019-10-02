#lang sicp

(#%require rackunit)

(define (f-recur n)
  (if (< n 3)
    n
    (+ (f-recur (- n 1))
       (f-recur (- n 2))
       (f-recur (- n 3)))))

(check-equal? (f-recur 2) 2)
(check-equal? (f-recur 3) 3)
(check-equal? (f-recur 6) 20)
(check-equal? (f-recur 10) 230)

(define (f-iter n)
  (define (iter a b c count)
    (if (= count 0)
      c
      (iter (+ a b c) a b (- count 1))))
  (iter 2 1 0 n))
    
(check-equal? (f-iter 2) 2)
(check-equal? (f-iter 3) 3)
(check-equal? (f-iter 6) 20)
(check-equal? (f-iter 10) 230)
