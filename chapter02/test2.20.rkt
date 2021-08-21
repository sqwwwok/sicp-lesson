#lang sicp
(define (same-patity . li)
  (if (even? (car li))
      (even-filter li)
      (odd-filter li)))

(define (even? x)
  (= (remainder x 2) 0))
(define (even-filter li)
  (if (null? li)
      nil
      (if (even? (car li))
      (cons (car li) (even-filter (cdr li)))
      (even-filter (cdr li)))))
(define (odd-filter li)
  (if (null? li)
      nil
      (if (even? (car li))
      (odd-filter (cdr li))
      (cons (car li) (odd-filter (cdr li))))))
  