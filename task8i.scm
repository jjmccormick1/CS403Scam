 (define (main)
        (setPort (open (getElement ScamArgs 1) 'read))
        (define arg (readExpr))
        (print "(ecfi " arg ") is ")
        (println (fmt "%.25f" (efci arg)) )
)

(define (efci num)
    (define (iter depth sum)
        (cond 
             ((< 0  depth) 
                (iter (- depth 1 ) 
                    (/ 1.0
                        (+ 1.0
                            (/ 1.0 
                                (+ (* 2  depth)
                                    (real (/ 1.0 
                                       (+ 1.0 sum)
                                    ))
                                )  
                            )
                        )   
                    )
                )
            )
            (else (real sum))
        )   

    )
    (real ( + 2 (iter num 0)))
)
