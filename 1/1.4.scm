
1 ]=> ; Observe that oru model of evaluation allows for combinations whose operators
; are compounded expression. Use this observation to describe teh behavior of
; following:
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;Value: a-plus-abs-b

1 ]=> ;As name of procedure implies, it performs a + |b|. If b is negative,
; it does a - b (where b is -ve; thus: a - (-b)) else does (+ a b)

(a-plus-abs-b 3 (- 4))

;Value: 7

1 ]=> (a-plus-abs-b 3 4)

;Value: 7

1 ]=> 
