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

(define (halve x)
    (define (iter num count total)
        (cond
            ((<= ( - num count) 0)
                total
                )
            ( (> (double (double count)) num)
                (iter (- num (double count)) 1 (+ total count))
                )
            ( (< (double count) num)
                (iter num (double count) total)
                )
        )    
    )
    (iter x 1 0 )
)

(define (div2? num)
    (== (halve num) (halve (+ num 1)))
)
