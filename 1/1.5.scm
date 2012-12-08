
1 ]=> 
; Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using applicative-order evaluation or normal-order evaluation. He defines the following two procedures:

(define (p) (p))

;Value: p

1 ]=> 
(define (test x y)
  (if (= x 0)
      0
      y))

;Value: test

1 ]=>
; what will (test 0 (p)) evaluate in application-order-evaluation and normal-evaluation

; Note that mit-scheme is an applicative-order interpreter.
; In this, first operands and operators are evaluated and then procedure is applied.
;Here (p) calls itself. Thus via this, it will go in disastrous infinite loop.

; While in normal evaluation, it follows 'fully-expand-then-contract' methodoloy, thus, (p) will not be called.
;if condition will check for (= x 0) and will return 0.


