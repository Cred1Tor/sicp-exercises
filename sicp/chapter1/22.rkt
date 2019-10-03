#lang sicp

(#%require rackunit)

(define (square a) (* a a))

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

(define (timed-prime-test n)
	(start-prime-test n (runtime)))

(define (start-prime-test n start-time)
    (cond ((prime? n)
	      (newline)
	      (display n)
              (report-prime (- (runtime) start-time)))))

(define (report-prime elapsed-time)
    (display " *** ")
      (display elapsed-time))

(define (search-for-primes start end)
  	(cond [(> start end) (newline)
		       	     (display "end of search")]
	      [(even? start) (search-for-primes (+ start 1) end)]
	      [else (timed-prime-test start)
  	      	    (search-for-primes (+ start 2) end)]))

(search-for-primes 1000000000 1000000030)
(search-for-primes 10000000000 10000000070)
(search-for-primes 100000000000 100000000070)
(search-for-primes 1000000000000 1000000000100)