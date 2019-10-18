#lang sicp 

(#%require "67.rkt")
(#%provide generate-huffman-tree)

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge tree-set)
  (if (= (length tree-set) 1) (car tree-set)
    (successive-merge (adjoin-set (make-code-tree (car tree-set)
			  		    	  (cadr tree-set))
	  		    	  (cddr tree-set)))))

(generate-huffman-tree `((B 3) (C 1) (D 1) (E 1) (A 8) (F 1) (G 1) (H 1)))
