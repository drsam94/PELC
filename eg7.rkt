#lang racket
(define(i p)(andmap(λ(n)(>(modulo p n)0))(cdr(build-list(inexact->exact(floor(sqrt p)))add1))))(define(p N)(filter i(cdr(build-list N add1))))(list-ref(p 200000)10000)
