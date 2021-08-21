#lang sicp
(define tolerance 0.00001)
(define (close-enough? g1 g2)
  (< (abs (- g1 g2)) tolerance))

(define (fixed-iter f g1 count)
  (let ((g2 (f g1)))
    ((display count)
     (newline)
     (if (close-enough? g1 g2)
        g2
        ((display g1)
         (newline)
         (fixed-iter f g2 (+ count 1)))))))
(define (fixed-point f g1)
  (fixed-iter f g1 0))
  