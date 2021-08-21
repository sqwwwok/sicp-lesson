#lang sicp
(define (fixed-point f first-guess)
  (define limit 0.000001)
  (let ((next-guess (f first-guess)))
    (if (< (abs (- next-guess first-guess)) limit)
        next-guess
        (fixed-point f next-guess))))

(define (deriv f)
  (define dx 0.000001)
  (lambda (x)
    (/ (- (f (+ x dx)) (f x)) dx)))

(define (newton-transform f)
  (lambda (x)
    (- x (/ (f x) ((deriv f) x)))))

(define (newton-method f)
  (fixed-point (newton-transform f) 1.0))

;ffffffffffffffffffffffffffffffffffffffffffffffffffff1.40
(define cube
  (lambda (x)
    (* x x x)))

(define square
  (lambda (x)
    (* x x)))

(define (cubic a b c)
  (lambda (x)
    (+ (* a (cube x))
       (* b (square x))
       c)))

;fffffffffffffffffffffffffffffffffffffffffffffffffffff1.41
(define (double f)
  (lambda (x)
    (f (f x))))

;fffffffffffffffffffffffffffffffffffffffffffffffffffff1.42
(define (compose f g)
  (lambda (x)
    (f (g x))))

;fffffffffffffffffffffffffffffffffffffffffffffffffffff1.43
(define (repeated f count)
  (if (= count 1)
      f
      (repeated (lambda (x) (f (f x)))
                (- count 1))))

;ffffffffffffffffffffffffffffffffffffffffffffffffffffff1.44
(define (smooth f)
  (define dx 0.000001)
  (lambda (x)
    (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

(define (smooth-n f n)
  (lambda (x)
    (((repeated smooth-n n) f) x)))

;fffffffffffffffffffffffffffffffffffffffffffffffffffffff1.45
(define (average-damp f)
  (lambda (x)
    (/ (+ x (f x)) 2)))

(define (n-power n x)
  (if (= n 1)
      x
      (if (= (remainder n 2) 0)
          (n-power (/ n 2) (square x))
          (* (n-power (- n 1) x) x))))
  
(define (n-root n x)
  (fixed-point ((repeated average-damp (- n 1))
                (lambda (y)
                  (/ x (n-power (- n 1) y))))
               1.0))

;ffffffffffffffffffffffffffffffffffffffffffffffffffffffff1.46

  




























   
























