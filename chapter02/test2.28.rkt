#lang sicp
(define (fringe tree)
  (if (null? tree)
      nil
      (if (pair? tree)
          (append (fringe (car tree))
                  (fringe (cdr tree)))
          (list tree))))
