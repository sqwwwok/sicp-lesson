#lang sicp
(define (square x)
  (* x x))
(define (average x y)
  (/ (+ x y) 2))


(define (iterative-improve good? improving)
  (lambda (x)
    (define (iter guess)
      (if (good? guess)
          guess
          (iter (improving guess))))
    (iter x)))

(define (sqrt n)
  ((iterative-improve (lambda (x) (< (abs (- (square x) n)) 0.000001))
                     (lambda (x) (average x (/ n x)))) 1.0))

(define (fixed-point f guess)
  ((iterative-improve (lambda (x) (< (abs (- x (f x))) 0.000001))
                      (lambda (x) (f x))) guess))