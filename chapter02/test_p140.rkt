#lang sicp
(define (add-poly p1 p2)
  (if  (same-variable? (variable p1) (variable p2))
       (make-poly (variable p1)
                  (add-terms (term-list p1)
                             (term-list p2)))
       (error "Polys not in same var -- ADD-POLY"
              (list p1 p2))))


(define (mul-poly p1 p2)
  (if (same-variable? (variable p1) (variable p2))
      (make-poly (variable p1)
                 (mul-terms (term-list p1)
                            (term-list p2)))
      (error "Polys not in same var -- MUL-POLY"
             (list p1 p2))))

(define (install-polynomial-package)
  ;internal procedures
  ;representation of poly
  (define (make-poly variable term-list)
    (cons variable term-list))
  (define (variable p) (car p))
  (define (term-list p) (cdr p))

  (define same-variable?)
  (define variable?)

  ;representation of terms term-list
  (define (add-poly p1 p2) ...)
  (define (mul-poly p1 p2) ...)

  ;interface to rest of system
  (define (tag p) (attach-tag 'polynomial p))
  (put 'add '(polynomial polynomial)
       (lambda (p1 p2) (tag (add-poly p1 p2))))
  (put 'mul '(polynomial polynomial)
       (lambda (p1 p2) (tag