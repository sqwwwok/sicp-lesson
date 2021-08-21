#lang sicp
(define (square x)
  (* x x))

(define (prime? n)
  (find-divisor n 3))

(define (find-divisor n product)
  (cond ((= (remainder n product) 0) #f)
        ((< (square product) n) (find-divisor n (+ 2 product)))
        (else #t)))

(define (odd-product start-num)
  (if (= (remainder start-num 2) 0)
      (+ start-num 1)
      (+ start-num 2)))

(define (test-iter n count start-time)
  (if (not (> count 0))
      (display "finished")
      ;(display "are primes")
      (if (prime? n)
          `((display n)
           (display "***")
           ;(display (- (runtime) start-time))
           ;(newline)
          (test-iter (+ n 2) (- count 1) (runtime)))
          (test-iter (+ n 2) count (runtime)))))

(define (test n)
    (test-iter (odd-product n) 3 (runtime)))
       

