 (define (main)
        (setPort (open (getElement ScamArgs 1) 'read))
        (define arg (readExpr))
        (inspect (efci arg))
)

(define (efci num)
    (define (iter depth sum)
        (cond 
             ((<= depth num) 
                (iter (+ depth 1 ) 
                    (/ 1 
                        (+ 1
                            (/ 1 
                                (+ (* 2 depth)
                                    (/ 1 sum)
                                )   
                            )
                        )   
                    )
                )
            )
        )        
    )
    ( + 2 (iter 0 1))
)
