(define (over-or-under num1 num2) (if (< num1 num2) -1 (if (= num1 num2) 0 1)))

(define (make-adder num) (lambda (inc) (+ num inc)))

(define (composed f g) (lambda (x) (f (g x))))

(define (repeat f n)
  (if (= n 0)
      (lambda (x) x)
      (if (= n 1)
          f
          (composed f (repeat f (- n 1))))))

(define (max a b)
  (if (> a b)
      a
      b))

(define (min a b)
  (if (> a b)
      b
      a))

(define (gcd a b) (if (= 0 (modulo (max a b) (min a b)))
                      (min a b)
                      (gcd (min a b) (modulo (max a b) (min a b)))
                      ))

(define (duplicate lst) (if (null? lst)
                            '()
                            (append (list (car lst)) (list (car lst)) (duplicate (cdr lst)) )
                            ))

(expect (duplicate '(1 2 3)) (1 1 2 2 3 3))

(expect (duplicate '(1 1)) (1 1 1 1))

(define (deep-map fn s) (if (null? s)
  '()
  (cons (if (list? (car s)) (deep-map fn(car s)) (fn (car s)) ) (deep-map fn (cdr s)))
  ))

