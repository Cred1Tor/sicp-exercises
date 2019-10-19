(define (get-record name file)
  ((get `get-record (type-tag file)) name file))

(define (get-salary name file)
  ((get `get-salary (type-tag file)) name file))

(define (find-employee-record name files)
  (accumulate append
	      nil
	      (map (lambda (file) (get-record name file))
       		   files)))

