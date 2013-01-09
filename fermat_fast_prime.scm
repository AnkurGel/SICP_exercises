
1 ]=> 
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? m) (remainder (square (expmod base (/ exp 2) m)) m ) )
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

;Value: expmod

1 ]=>
(define (fermat n)
  (define (try-it a)(= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat n) (fast-prime? n (- times 1)))
        (else false))
  )

;Value: fermat

1 ]=> 
;Value: fast-prime?

1 ]=> (fast-prime? 83 4)

;Value: #t

1 ]=> (fast-prime? 93 2)

;Value: #f

1 ]=> (prime? 103434)

;Value: #f

1 ]=> (fast-prime? 103434 2)

;Aborting!: out of memory
;GC #2: took:   0.20  (29%) CPU time,   0.20  (30%) real time; free: 4191888
;GC #3: took:   0.10 (100%) CPU time,   0.20 (100%) real time; free: 4191928

1 ]=> (fast-prime? 103434 3)

;Aborting!: out of memory
;GC #5: took:   0.20  (33%) CPU time,   0.20  (30%) real time; free: 4191864
;GC #6: took:   0.10 (100%) CPU time,   0.20  (94%) real time; free: 4191886

1 ]=> (fast-prime? 103 3)

;Value: #t

1 ]=> (fast-prime? 103434 1)

;Aborting!: out of memory
;GC #8: took:   0.30  (50%) CPU time,   0.20  (31%) real time; free: 4191822
;GC #9: took:   0.20 (100%) CPU time,   0.20  (94%) real time; free: 4191844

1 ]=> 