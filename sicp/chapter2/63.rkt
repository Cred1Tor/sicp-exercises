#lang sicp

(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define (tree->list-1 tree)
    (if (null? tree)
            '()
	          (append (tree->list-1 (left-branch tree))
			                (cons (entry tree)
					                          (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
    (define (copy-to-list tree result-list)
          (if (null? tree)
	            result-list
		            (copy-to-list (left-branch tree)
					                        (cons (entry tree)
								                                  (copy-to-list (right-branch tree)
														                                          result-list)))))
      (copy-to-list tree '()))

(define tree1 (list 7
		    (list 3
			  (list 1 nil nil)
			  (list 5 nil nil))
		    (list 9
			  nil
			  (list 11 nil nil))))

(define tree2 (list 3
		    (list 1 nil nil)
		    (list 7
			  (list 5 nil nil)
			  (list 9
				nil
				(list 11 nil nil)))))

(define tree3 (list 5
		    (list 3
			  (list 1 nil nil)
			  nil)
		    (list 9
			  (list 7 nil nil)
			  (list 11 nil nil))))

(tree->list-1 tree1)
(tree->list-1 tree2)
(tree->list-1 tree3)
(tree->list-2 tree1)
(tree->list-2 tree2)
(tree->list-2 tree3) ; all results are the same
