#lang racket

(define (index-of l x)
  (for/or ([y l] [i (in-naturals)] #:when (equal? x y)) i))

(define (biggest-cycle x)
  (define (helper prev lst)
    (let ([n (modulo (* 10 prev) x)])
      (if (zero? n) 0
        (if (and (member (* 10 prev) lst) (< x (* 10 prev))) 
            (- (length lst) (index-of lst (* 10 prev))) 
            (helper n (append lst (cons (* 10 prev) '())))))))
  (helper 1 '()))

(define (euler26)
  (define (f x max maxn)
    (let ([k (biggest-cycle x)])
      (if (= x 1000) maxn
          (if (> k max) (f (add1 x) k x) (f (add1 x) max maxn)))))
  (f 1 0 0))
        
  