#lang sicp
(define (cont-frac n d k)
  (if (= k 1)
      (/ n d)
      (/ n (+ d (cont-frac n d k)))))

(define (fol n d k)
  (define (fol-iter result count)
     (if (= count k)
         result
         (fol-iter (/ n (+ result d)) (+ count 1))))
   (fol-iter 0 0))

;fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
(define (d-product k)
  (if (or (= (remainder (+ 1 k) 3) 1) (= (remainder (+ 1 k) 3) 0))
      1
      (/ (* 2 (+ k 2)) 3)))
(define (ola-frac n d k fixed-k)
  (define d (d-product (- fixed-k k)))
  (display d)
  (newline)
  (if (= k 1)
      (/ n d)
      (/ n (+ d (ola-frac n d (- k 1) fixed-k)))))

(define (ola k)
  (ola-frac 1.0 0 k k))

;ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
(define (tan-frac x k)
  (define (d-product count)
    (- (* 2 count) 1))
  (define (n-product count)
    (if (= count 0)
        1
        (* (n-product (- count 1)) x)))
  (define (iter count)
    (define n (n-product count))
    (define d (d-product count))
    (if (= k count)
        (/ n d)
        (/ n (+ d (iter (+ count 1))))))
  (iter 1))
  