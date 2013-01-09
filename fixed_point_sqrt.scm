(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))
(define tolarance 0.0001)

(define (sqt x)
  (fixed-point (lambda (y) (average y (/ x y))) 1.0))
