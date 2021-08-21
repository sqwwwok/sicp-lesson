#lang sicp
(define (even? x)
  (= (remainder x 2) 0))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (yk k)
    (f (+ a (* k h))))
  (define (simpson-iter n)
    (cond ((= n 0) (+ (yk n) (yk 0)))
          ((even? n) (+ (* 2 (yk n)) (simpson-iter (- n 1))))
          (else (+ (* 4 (yk n)) (simpson-iter (- n 1))))))
  (* (/ h 3) (simpson-iter n)))


(define (cube x)
  (* x x x))

;fengefenge

(define (sum-func f next a b)
  (if (> a b)
      0
      (+ (f a) (sum-func f next (next a) b))))

(define (sum term next a b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

;fenggefengfgewajn

(define (mult-resc term next a b)
  (if (> a b)
      1
      (* (term a) (mult-resc term next (next a) b))))

(define (mult-iter term next a b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

;dddddddddddddddddddddddd

(define (fol n)
  (define (term x)
    (if (even? x)
        (/ (+ x 2) (+ x 1))
        (/ (+ x 1) (+ x 2))))
  (define (next x)
    (+ x 1))
  (* 4 (mult-resc term next 1 n)))

;dddddddddddddddddddddddddddddd

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (accumulate combiner null-value term (next a) next b))))

(define (accumulate-x combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term (next a))))))
  (iter a null-value))

      
