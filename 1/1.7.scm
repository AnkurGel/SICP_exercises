
1 ]=> (define (square x) (* x x))

;Value: square

1 ]=> (define (average x y) (/ (+ x y) 2))

;Value: average


2 error> 
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

;Value: sqrt-iter

2 error> (define (improve guess x)(average guess (/ x guess)))

;Value: improve

2 error> (define (good-enough? guess x)
           (< (abs (- (square guess) x)) 0.001))

;Value: good-enough?

2 error> (define (sqt x) (sqrt-iter 1.0 x))

;Value: sqt

2 error> (sqt 2)

;Value: 1.4142156862745097

2 error> (sqrt 2)

;Value: 1.4142135623730951

2 error> (improve 1.4142135623730951 2)

;Value: 1.414213562373095

2 error>
(define (verify guess x)
  (abs (/ (- (square guess) x) guess)))


(define (good-enough? guess x)
  (< (verify guess x) 0.0001))

;Value: verify
;Value: good-enough?


2 error> (sqt 3)

;Value: 1.7321428571428572

2 error> (sqrt 3)

;Value: 1.7320508075688772
2 error> (exit)


Kill Scheme (y or n)? y
Yes
Moriturus te saluto.

Process scheme finished

