; black box square root
(define (sqt x)
  (define (square x) (* x x))
  (define (average x y) (/ (+ x y) 2))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (define (improve guess) (average guess (/ x guess)))
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (sqrt-iter 1.0))
(sqt 3)
