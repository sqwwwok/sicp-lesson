#lang sicp
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

;2.33
(define (map p sequence)
  (accumulate (lambda (x y)
                (cons (p x) y))
              nil
              sequence))

(define (append x y)
  (accumulate cons y x))

(define (length sequence)
  (accumulate (lambda (x y)
                (if (not (null? x))
                    (+ 1 y)))
              0
              sequence))

;2.34
(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
                (+ (* higher-terms x) this-coeff))
              0
              coefficient-sequence))

;2.35
(define (count-leaves tree)
  (accumulate +
              0
              (map (lambda (sub-tree)
                     (if (pair? sub-tree)
                         (count-leaves sub-tree)
                         1))
                   tree)))

;2.36
(define (accumulate-n op init matrix)
  (if (null? (car matrix))
      nil
      (cons (accumulate op init (map car matrix))
            (accumulate-n op init (map cdr matrix)))))

;2.37
(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (vec)
         (dot-product v vec))
       m))

(define (transpose mat)
  (accumulate-n list
                (list nil)
                mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) (matrix-*-vector cols x))
         m)))

;2.38
(define (fold-right op initial sequence)
  (accumulate op initial sequence))
(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

;2.39
(define (reverse sequence)
  (fold-right (lambda (x y)
                (if (null? y)
                    (list x)
                    (append y (list x))))
              nil
              sequence))
(define (reverse- sequence)
  (fold-left (lambda (x y) (cons y x)) nil sequence))
                



         









  
  

             