#lang sicp

(#%require "41.rkt")

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
      (list empty-board)
      (filter
	(lambda (positions) (safe? k positions))
	(flatmap
	  (lambda (rest-of-queens)
	    (map (lambda (new-row)
		   (adjoin-position new-row k rest-of-queens))
		 (enumerate-interval 1 board-size)))
	  (queen-cols (- k 1))))))
  (queen-cols board-size))

(define empty-board nil)

(define (adjoin-position n k positions)
  (append positions (list n)))

(define (safe? k positions)
  (define last-queen-pos (list-ref positions (- k 1)))
  (define (iter rest-positions)
    (cond [(null? (cdr rest-positions)) #t]
	  [(= (car rest-positions) last-queen-pos) #f]
	  [(= (- (length rest-positions) 1) (abs (- (car rest-positions) last-queen-pos))) #f]
	  [else (iter (cdr rest-positions))]))
  (iter positions))

(queens 8)
(length (queens 8))

(define (queens-slow board-size)
  (define (queen-cols k)
    (if (= k 0)
      (list empty-board)
      (filter
	(lambda (positions) (safe? k positions))
	(flatmap
	  (lambda (new-row)
	    (map (lambda (rest-of-queens)
		   (adjoin-position new-row k rest-of-queens))
		 (queen-cols (- k 1))))
	 (enumerate-interval 1 board-size)))))
  (queen-cols board-size))

(queens-slow 8)
