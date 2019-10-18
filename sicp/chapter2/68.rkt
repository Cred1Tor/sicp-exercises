#lang sicp

(#%require "67.rkt")
(#%provide encode)

(define (encode message tree)
  (if (null? message)
    `()
    (append (encode-symbol (car message) tree)
	    (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
    (define (get-bits current-branch)
      (cond [(leaf? current-branch) `()]
	    [(pair? (memq symbol (symbols (left-branch current-branch))))
	     (cons 0 (get-bits (left-branch current-branch)))]
	    [else (cons 1 (get-bits (right-branch current-branch)))]))
  (if (not (pair? (memq symbol (symbols tree))))
    (error "there's no such symbol in the tree -- ENCODE-SYMBOL" symbol)
    (get-bits tree )))


 (define sample-tree
   (make-code-tree (make-leaf 'A 4)
                   (make-code-tree
                    (make-leaf 'B 2)
                    (make-code-tree (make-leaf 'D 1)
                                    (make-leaf 'C 1)))))

(encode `(A D A B B C A) sample-tree)
