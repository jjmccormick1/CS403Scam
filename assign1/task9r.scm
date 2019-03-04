(define (main)
        (setPort (open (getElement ScamArgs 1) 'read))
        (define arg (readExpr))
        (define ram  (ramanujanr arg))
        (println "(ramanujanr " arg ") is " (fmt "%.25f" ram) )
        (println "$4$")
)
 
 
(define (ramanujanr depth)
    (define (recur x)
        (cond 
            ( (<= x depth)
                (*
                    (+ x 1)
                    (sqrt 
                        (+
                            (+ x 6)
                            (recur (+ x 1))
                        )   
                    )
                )
            )
            (else 0)
        )
    )
    (recur 0)
)
