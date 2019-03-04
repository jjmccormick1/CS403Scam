(define (main)
        (setPort (open (getElement ScamArgs 1) 'read))
        (define n (readExpr))
        (define root (readExpr))
        (print "((root-n " n ") " root ") is " )
        (println (fmt "%.15f" ((root-n (real n)) (real root))))
)

(define (root-n pow)
    (lambda (num)
        (define guess1 (/ num 3))
        (define pow1  (- pow 1))
        (define (root num guess)
            (define next 
                (real (/
                    (+ (* pow1 guess) (/ num  (power pow1 guess guess)))
                    pow
                ))
            )
            (cond 
                ((not (good-enough? next guess)) (root num next)
                 
                )(else next)
            )
        )
        (real (root num guess1))
    )
)

(define (power p num total)
    (cond
        ( ( > p 1) 
            (power (- p 1) num (* num total))  
        )
        (else total)
    )
)
(define (good-enough? guess x)
    (< (abs (- guess x)) 0.0000000000000001)
)
