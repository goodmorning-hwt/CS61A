(define (cadr lst) (car (cdr lst)))

(define (make-kwlist1 keys values)
  (list keys values)
  )

(define (get-keys-kwlist1 kwlist) (car kwlist))

(define (get-values-kwlist1 kwlist)
  (cadr kwlist))

(define (make-kwlist2 keys values)
  (if (or (null? keys) (null? values))
      '()
      (map (lambda (key value) (list key value))
      keys values)))


(define (get-keys-kwlist2 kwlist)
  (map (lambda (t) (car t))
  kwlist))

(define (get-values-kwlist2 kwlist)
  (map (lambda (t) (cadr t))
  kwlist))

(define (add-to-kwlist kwlist key value)
  (make-kwlist
    (append (get-keys-kwlist kwlist) (list key))
    (append (get-values-kwlist kwlist) (list value))))

(define (get-first-from-kwlist kwlist key)
  (if (null? kwlist)
      '()
      ((if (= key (car (get-keys-kwlist kwlist)))
           (car (get-values-kwlist kwlist))
           (get-first-from-kwlist (cdr kwlist) key)
           ))))
