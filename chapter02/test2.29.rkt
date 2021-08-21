#lang sicp
(define (make-mobile left right)
  (list left right))
(define (make-branch length structure)
  (list length structure))
(define test-mobile-1 (make-mobile (make-branch 4 (make-mobile (make-branch 3 2)
                                                             (make-branch 2 5)))
                                 (make-branch 7 2)))
(define test-mobile-2 (make-mobile (make-branch 3
                                                (make-mobile (make-branch 1 3)
                                                             (make-branch 3 1)))
                                   (make-branch 2 6)))
                                              

;(a)
(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  (cadr mobile))
(define (branch-length branch)
  (car branch))
(define (branch-structure branch)
  (cadr branch))

;(b)
(define (total-weight item)
  (if (null? item)
      0
      (if (pair? item)
          (+ (total-weight (branch-structure (left-branch item)))
             (total-weight (branch-structure (right-branch item))))
          item)))

;(c)
(define (balance-torque? item)
  (= (* (total-weight (branch-structure (left-branch item)))
        (branch-length (left-branch item)))
     (* (total-weight (branch-structure (right-branch item)))
        (branch-length (right-branch item)))))       
(define (balance? item)
  (if (pair? item)
      (and (balance-torque? item)
           (balance? (branch-structure (left-branch item)))
           (balance? (branch-structure (right-branch item))))
      #t))

;(d)
;cadr --> cdr
      
















