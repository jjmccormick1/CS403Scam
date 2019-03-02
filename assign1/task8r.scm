 
 (define (main)
        (setPort (open (getElement ScamArgs 1) 'read))
        (define arg (readExpr))
        (inspect (efci arg))
)

(define (efci num)
    (define (iter depth)
        (cond 
             ((<= depth num) 
                (/ 1 
                    (+ 1
                        (/ 1 
                            (+ (* 2 depth)
                                (/ 1 
                                    ( + 1
                                        (iter (+ depth 1))
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
    ( + 2 (iter 1.0))
)
