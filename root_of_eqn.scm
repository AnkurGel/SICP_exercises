; Root of an equation using half interval method
; it goes with two endpoints. a, where f(a) is negative; b, where f(b)
; is positive. And halves the interval each time along midpoint. if
; f(mid_point) >= 0, then b becomes mid_point, if
; f(mid_point) <0 then a becomes mid_point

(define (search f neg_point pos_point)
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
