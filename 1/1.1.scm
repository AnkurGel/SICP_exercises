1 ]=> 10

;Value: 10

1 ]=> (- 9 1)

;Value: 8

1 ]=> (/ 6 2)

;Value: 3

1 ]=> (+ (* 2 4) (- 4 6))

;Value: 6

1 ]=> (define a 3)

;Value: a

1 ]=> (define b (+ a 1))

;Unbound variable: +a
;To continue, call RESTART with an option number:
; (RESTART 3) => Specify a value to use instead of +a.
; (RESTART 2) => Define +a to a given value.
; (RESTART 1) => Return to read-eval-print level 1.

2 error> (define b (+ a 1))


;Value: 4

2 error> (+ a b (* a b))

;Value: 19

2 error> (= a b)

;Value: #f

2 error> (if (and (> b a) (< b (* a b)))
b
a)

;Value: 4 ; since a = 3, b = 4; (< 4 (* 3 4)) is true

2 error> 
(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))

;Value: 16 ; 2nd condition is fullfilled, 6 + 7 + 3 => 16

2 error> (+ 2 (if (> b a) b a) ) 

;Value: 6 ; if condition is true, so it returns b (4) which gets added to 2

2 error> (* (cond ((> b a) a)
                  ((< a b) b)
                  (else -1))
            (+ a 1))

;Value: 12; (> b a) is true, a is returned and multiplied with (+ a 1) => 3 * 4 => 12

2 error> (exit)


Kill Scheme (y or n)? y
Yes
Moriturus te saluto.

Process scheme finished


