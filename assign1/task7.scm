(define (main)
        (setPort (open (getElement ScamArgs 1) 'read))
        (define arg1 (readExpr))
        (define arg2 (readExpr))
        (println "(halve " arg1 ") is " (halve arg1))
        (println "(double " arg1 ") is " (double arg1))
        (println "(div2? " arg1 ") is " (div2? arg1))
        (println "(ethiop " arg1 " " arg2 ") is " (ethiop arg1 arg2))
)

(define (ethiop arg1 arg2)
    (define (iter x y total)
        (cond
            ( ( >= y 1) (iter 
                            (double x)
                            (halve y)
                            (+ total 
                                (if (div2? y) 0 x)
                            )
                        )
              
            )(else total)
        )
    )
    (iter arg1 arg2 0)
)

(define (double num)
    (+ num num)
)

(define (halve num)
    (define (iter minus n)
        (cond
            ((> n 1) (iter (+ 1 minus) (- n 2)))
            (else minus)
        )
    )  
    (iter 0 num)      
)
    
(define (div2? num)
    (== (halve num) (halve (+ num 1)))
)
