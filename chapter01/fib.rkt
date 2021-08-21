#lang sicp
(define (even? x)
  (= (remainder x 2) 0))

(define (fib n)
  (fib-iter 1 0 0 1 n))
 
   
(define (fib-iter a b p q n)
  (cond ((= n 0) b)
        ((even? n) (fib-iter a
                             b
                             (+ (* p p) (* q q))
                             (+ (* 2 p q) (* q q))
                             (/ n 2)))
        (else (fib-iter (+ (* a (+ p q)) (* b q))
                        (+ (* a q) (* b p))
                        p
                        q
                        (- n 1)))))