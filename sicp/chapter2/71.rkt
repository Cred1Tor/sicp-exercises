#lang sicp

(#%require "69.rkt")
(#%require "68.rkt")

(define tree5 (generate-huffman-tree `((A 1) (B 2) (C 4) (D 8) (E 16))))
(define tree10 (generate-huffman-tree `((A 1) (B 2) (C 4) (D 8) (E 16) (F 32) (G 64) (H 128) (I 256) (J 512))))

(encode `(A) tree5) ; 4
(encode `(E) tree5) ; 1
(encode `(A) tree10) ; 9
(encode `(J) tree10) ; 1
