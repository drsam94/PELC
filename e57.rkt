#lang racket

(define (digits x)
  (if (< x 10) 1 (add1 (digits (quotient x 10)))))

(define (nth-conv n)
  (define (help m)
    (if (= m 1) 1/2 (/ 1 (+ 2 (help (sub1 m))))))
  (add1 (help n)))

(define (topheavy r)
  (if (> (digits (numerator r)) (digits (denominator r))) 1 0))

(foldr + 0 (map (λ (x) (topheavy (nth-conv x))) (build-list 1000 add1)))