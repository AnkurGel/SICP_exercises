MIT/GNU Scheme running under GNU/Linux
Type `^C' (control-C) followed by `H' to obtain information about interrupts.

Copyright (C) 2011 Massachusetts Institute of Technology
This is free software; see the source for copying conditions. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Image saved on Thursday October 27, 2011 at 7:44:21 PM
  Release 9.1 || Microcode 15.3 || Runtime 15.7 || SF 4.41 || LIAR/i386 4.118 || Edwin 3.116

1 ]=> 
(define (sqrt x)
  (define (square x) (* x x))
  (define (average x y) (/ (+ x y) 2))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (define (improve guess) (average guess (/ x guess)))
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (sqrt-iter 1.0)
  )

;Value: sqrt

1 ]=> (sqrt 3)

;Value: 1.7321428571428572

1 ]=> (sqrt 3)

;Value: 1.7321428571428572

1 ]=> (sqrt 4)

;Value: 2.0000000929222947

1 ]=> 
(define (sqt x)
  (define (square x) (* x x))
  (define (average x y) (/ (+ x y) 2))
  (define (sqrt-iter guess)
    (if (good-enuf? guess)
        guess
        (sqrt-iter (improve guess))))
  (define (good-enuf? guess)
    (> (abs (- (square guess) x)) 0.01))
  (define (improve guess) (average guess (/ x guess)))
  (sqrt-iter 1.0))

;Value: sqt

1 ]=> (sqt 3)

;Value: 1.

1 ]=> (sqt 4)

;Value: 1.

1 ]=> 
(define (sqt x)
  (define (square x) (* x x))
  (define (average x y) (/ (+ x y) 2))
  (define (sqrt-iter guess)
    (if (good-enuf? guess)
        guess
        (sqrt-iter (improve guess))))
  (define (good-enuf? guess)
    (< (abs (- (square guess) x)) 0.01))
  (define (improve guess) (average guess (/ x guess)))
  (sqrt-iter 1.0))

;Value: sqt

1 ]=> (sqt 3)

;Value: 1.7321428571428572

1 ]=> 
(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1)) (fib (- n 2))))))

;Value: fib

1 ]=> (fib 5)

;Value: 5

1 ]=> fib(10)

;Value 11: #[compound-procedure 11 fib]

1 ]=> 
;The object 10 is not applicable.
;To continue, call RESTART with an option number:
; (RESTART 2) => Specify a procedure to use in its place.
; (RESTART 1) => Return to read-eval-print level 1.

2 error> (fib 10)

;Value: 55

2 error> (fib 8)

;Value: 21

2 error> 
(define (fast-exp b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-exp b (/ n 2))))
        (else (* b (fast-exp b (- n 1))))))

;Value: fast-exp

2 error> (define (even? n) (= (remainder n 2) 0))

;Value: even?

2 error> (fast-exp 2 10)

;Value: 1024

2 error> (fast-exp 3 10)

;Value: 59049

2 error> (sqt 65536)

;Value: 256.0000000000065

2 error> (fast-exp 2 20)

;Value: 1048576

2 error> (fast-exp 2 15)

;Value: 32768

2 error> (fast-exp 2 16)

;Value: 65536

2 error> 
(define (A x y)
  (cond ((= x 0) (* 2 y))
        ((= y 0) 0)
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))

;Value: a

2 error> (A 1 10)

;Value: 1024

2 error> (A 2 4)

;Value: 65536

2 error> (define (smallest-divisior n)
           (find-divisor n 2))

;Value: smallest-divisior

2 error> 
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

;Value: find-divisor

2 error> (define (divides? a b) (= (remainder b a) 0))

;Value: divides?

2 error> (define (prime? n)
           (= n (smallest-divisior n)))

;Value: prime?

2 error> (prime? 3)

;Value: #t

2 error> (prime? 101)

;Value: #t

2 error> (prime? 120)

;Value: #f

2 error> 
(define (p? n)
  (= n (smallest-divisor n)))
(define (smallest-divisor n)
  (find-divisor n 2))


;Value: p?

2 error> 
(define (find-divisor n test)
  (cond ((> (square test) n) n)
        ((divides? n test) test)
        (else (find-divisor n (+ 1 test)))))

;Value: smallest-divisor

2 error> 
;Value: find-divisor

2 error> (define (divides? a b)
           (= 0 (remainder a b)))

;Value: divides?

2 error> (p? 3)

;Value: #t

2 error> (p? 4)

;Value: #f

2 error> (p? 10)

;Value: #f

2 error> 
(define (expmod b n m)
  (cond ((= n 0) 1)
        ((even? n) (remainder (square (expmod b (/ n 2) m)) m))
        (else (remainder (* b (expmod b (- n 1) m)) m))))

;Value: expmod

2 error> (define (fermat-test n)
           (define (try-it a)
             (= (expmod a n n) a))
           (try-it (+ 1 (random (- n 1)))))

;Value: fermat-test

2 error> (define (ferm? n times)
           (cond ((= times 0) true)
                 ((fermat-test n) (ferm? n (- times 1)))
                 (else false)))

;Value: ferm?

2 error> (ferm? 7)

;The procedure #[compound-procedure 12 ferm?] has been called with 1 argument; it requires exactly 2 arguments.
;To continue, call RESTART with an option number:
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

3 error> (ferm? 7 3)

;Value: #t

3 error> (ferm? 101 3)

;Value: #t

3 error> 
(p? 1999)

;Value: #t

3 error> 
(p? 19999)

;Value: #f

3 error> (define (sum-integers a b)
           (cond ((> a b) 0)
                 (else (+ a (sum-integers (+ a 1) b)))))

;Value: sum-integers

3 error> (sum-integers 3 6)

;Value: 18

3 error> (define (sum term a next b)
           (if (> a b)
               0
               (+ (term a) (sum term (next a) next b))))

;Value: sum

3 error> (define (sum-of-cubes a b)
           (sum (lambda (x) (cube x)) a (lambda (x) (+ x 1)) b))

;Value: sum-of-cubes

3 error> (sum-of-cubes 1 10)

;Unbound variable: cube
;To continue, call RESTART with an option number:
; (RESTART 5) => Specify a value to use instead of cube.
; (RESTART 4) => Define cube to a given value.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

4 error> (define (cube x) (* x x x))

;Value: cube

4 error> (sum-of-cubes 1 10)

;Value: 3025

4 error> (define (identity a b)
           (sum (lambda (x) (x)) a (lambda (x) (+ x 1)) b))

;Value: identity

4 error> (identity 1 10)

;The object 10 is not applicable.
;To continue, call RESTART with an option number:
; (RESTART 5) => Specify a procedure to use in its place.
; (RESTART 4) => Return to read-eval-print level 4.
; (RESTART 3) => Return to read-eval-print level 3.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.

5 error> (define (identity a b)
           (sum (lambda (x) x) a (lambda (x) (+ x 1)) b))

;Value: identity

5 error> (identity 1 10)

;Value: 55

5 error> (define (pi-sum a b)
           (sum (lambda (x) (/ 1.0 (* x (+ x 2))))
                a
                (lambda (x) (+ x 4))
                b))

;Value: pi-sum

5 error> (pi-sum 1 1000)

;Value: .39244908194872286

5 error> (* 8(pi-sum 1 1000))

;Value: 3.139592655589783

5 error> (define (f x y)
           (let ((a (+ 1 (* x y)))
                 (b (- 1 y)))
             (+ (* x (square a))
                (* y b)
                (* a b))))

;Value: f

5 error> (f 1 2)

;Value: 4

5 error> (positive? 4)

;Value: #t

5 error> (negative? -3)

;Value: #t

5 error> 
(negative? 3)

;Value: #f

5 error> (define (search f neg_point pos_point)
  (let ((midpoint (average neg_point pos_point)))
    (if (close-enuf? neg_point pos_point)
        midpoint
        (let ((test-value (f midpoint)))
          (cond ((positive? midpoint)
                 (search f neg_point midpoint))
                ((negative? midpoint)
                 (search f midpoint pos_point))
                (else midpoint))))))
(define (close-enuf? a b)
  (< (abs (- a b)) 0.001))
(define (average x y) (/ 2 (+ x y)))

(define (half-interval-method f a b)
  (let ((a_value (f a))
        (b_value (f b)))
    (cond ((and (negative? a_value) (positive? b_value))
           (search f a b))
          ((and (positive? a_value) (negative? b_value))
           (search f b a))
          (else (error "Values not found in neg and positive range" a b)))))

;Value: search

5 error> 
;Value: close-enuf?

5 error> 
;Value: average

5 error> 
;Value: half-interval-method

5 error> (half-interval-method sin 2.0 4.0)
