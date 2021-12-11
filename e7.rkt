#lang racket

(define (isPrime p)
  (andmap (λ (n) (not (zero? (modulo p n)))) (cdr (build-list (inexact->exact (floor (sqrt p))) add1))))
(define (primes N)
  (filter isPrime (cdr (build-list N add1))))
(define (euler7)
  (list-ref (primes 1000000) 10000))
(euler7)