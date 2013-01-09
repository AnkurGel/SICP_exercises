
1 ]=> 
(define (smallest-divisor n)
  (find-divisor n 2)) ; starting from 2

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? n test-divisor) test-divisor)
        (else (find-divisor n (+ 1 test-divisor)))))

(define (divides? a b) (= (remainder a b) 0) )

(define (prime? n)
  (= n (smallest-divisor n)))


;Value: prime?

1 ]=> 
;Value: smallest-divisor

1 ]=> 
;Value: find-divisor

1 ]=> 
;Value: divides?

1 ]=> 
(prime? 21)

;Value: prime?

1 ]=> 
;Value: #f

1 ]=> (prime? 83)

;Value: #t

1 ]=> 