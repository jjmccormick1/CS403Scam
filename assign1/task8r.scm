 
 (define (main)
        (setPort (open (getElement ScamArgs 1) 'read))
        (define arg (readExpr))
        (define result (efcr arg))
        (print "(ecfr " arg ") is ")
        (println (fmt "%.25f" (efcr arg)) ")")
)

(define (efcr num)
    (define (recur depth)
        (cond 
             ((<= depth num) 
                (/ 1 
                    (+ 1
                        (/ 1 
                            (+ (* 2 depth)
                                (/ 1 
                                    ( + 1
                                        (recur (+ depth 1))
                                    )
                                ) 
                            )   
                        )
                    )   
                )
            )
            (else 0)
        )        
    )
    (real ( + 2 (recur 1.0)))
)
