#lang sicp 

(#%require "67.rkt")
(#%require "68.rkt")
(#%require "69.rkt")

(define rock-tree (generate-huffman-tree `((A 2) (BOOM 1) (GET 2) (JOB 2) (NA 16) (SHA 3) (YIP 9) (WAH 1))))

(length (encode `(GET A JOB
	  SHA NA NA NA NA NA NA NA NA
	  GET A JOB
	  SHA NA NA NA NA NA NA NA NA
	  WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP
	  SHA BOOM) rock-tree)) ; 84 / 108
