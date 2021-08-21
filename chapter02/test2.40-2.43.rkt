#lang sicp
(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
         (else (filter predicate (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

;2.40
(define (unique-pairs n)
  (flatmap (lambda (i)
                  (map (lambda (j) (list j i))
                       (enumerate-interval 1 (- i 1))))
                (enumerate-interval 1 n)))

;2.41
(define (three-pairs n s)
  (flatmap (lambda (i)
             (map (lambda (j) (list i j (- s i j)))
                  (enumerate-interval 1 (- s i 1))))
           (enumerate-interval 1 n)))

;2.42
(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(define empty-board nil)

(define (adjoin-position new-row k rest-of-queens)
  (append rest-of-queens (list (cons k new-row))))

(define (safe? k positions)
  (if (null? (cdr positions))
      #t
      (if (or (= (cdr (car positions)) (cdr (search-k k positions)))
              (= (abs (- (cdr (car positions)) (cdr (search-k k positions))))
                 (abs (- (car (car positions)) k))))
          #f
          (safe? k (cdr positions)))))

(define (search-k k positions)
  (if (= k (car (car positions)))
      (car positions)
      (search-k k (cdr positions))))

;2.43

  
  


