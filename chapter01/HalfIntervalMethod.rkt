#lang sicp
(define (search f neg-point pos-point)
  (let ((midpoint (/ (+ neg-point pos-point) 2)))
    (if (close-enough? neg-point pos-point)
        midpoint
        (let ((test-value (f midpoint)))
          (cond ((positive? test-value) (search f neg-point midpoint))
                ((negative? test-value) (search f midpoint pos-point))
                (else midpoint))))))

(define (close-enough? low high)
  (< (abs (- low high)) 0.001))

(define (HalfIntervalMethod f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negative? a-value) (positive? b-value))
           (search f a b))
          ((and (negative? b-value) (positive? a-value))
           (search f b a))
          (else
           (error "Value are not opposite sign" a b)))))