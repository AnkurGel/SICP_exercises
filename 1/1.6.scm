
1 ]=> ;Alyssa P. Hacker doesn't see why if needs to be provided as a special form.
;"Why can't I just define it as an ordinary procedure in terms of cond?" she asks.
;Alyssa's friend Eva Lu Ator claims this can indeed be done, and she defines a new version of if:
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

;Value: new-if

1 ]=> ; This new-if is a new procedure. Unlike `if`, it is a gen procedure and works in applicative order. eg:
(new-if (= 2 3) 0 5)

;Value: 5

1 ]=> (new-if (= 1 1) 0 6)

;Value: 0

1 ]=> ; In sqrt-iter procedure, being applicative-order, it will first evaluate the operands and operators
; and then apply procedure:
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))

;Value: sqrt-iter

1 ]=> (define (square x) (* x x))

;Value: square

1 ]=> (define (average x y) (/ (+ x y) 2))

;Value: average

1 ]=> (define (improve guess x) (average (guess (/ x guess))))

;Value: improve

1 ]=> 
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

;Value: good-enough?

1 ]=> 
; As can be seen, new-if procedre on line 23 will first evaluate operands, thus calling sqrt-iter endlessly.(infinite)


