
1 ]=> 
; Define a procedure that takes three numbers as arguments and returns the sum
; of the squares of two larger numbers
(define (sum_of_two_largest a b c)
  (cond ((and (< a b) (< a c)) (+ (* b b) (* c c)))
        ((and (< b a) (< b c)) (+ (* a a) (* c c)))
        (else (+ (* a a) (* b b)))))

;Value: sum_of_two_largest

1 ]=> (sum_of_two_largest 4 3 5)

;Value: 41

1 ]=> 
