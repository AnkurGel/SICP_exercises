; To check if a number is prime or not
; Goes over till square-root of number to check if divisor exists. O(sqrt(n))
(define (prime? n)

  (define (min-div)
    (find-divisor 2))
  (define (find-divisor test)
    (cond ((> (square test) n) n)
          ((= 0 (remainder n test)) test)
          (else (find-divisor (+ test 1)))))
  (define (square x) (* x x))
  (= n (min-div)))  
