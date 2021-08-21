#lang sicp
(define (deep-reverse items)
  (if (null? items)
      nil
      (if (pair? items)
          (cons (deep-reverse (car (reverse items)))
                (deep-reverse (cdr (reverse items))))
          items)))
(deep-reverse (list (list 2 3) 1))

