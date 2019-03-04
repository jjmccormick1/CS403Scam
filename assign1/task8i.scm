 (define (main)
        (setPort (open (getElement ScamArgs 1) 'read))
        (define arg (readExpr))
        (inspect (efci arg))
)

(define (efci num)
    (define (iter depth sum)
        (cond 
             ((<= depth num) 
                (inspect depth)
                (inspect num)
                (inspect sum)
                (inspect (iter (+ depth 1 ) 
                    (real (/ 1 
                        (+ 1
                            (/ 1 
                                (inspect (+ (inspect (* 2 (- num depth)))
                                    (/ 1 
                                        (cond
                                            ((= depth 0)
                                            (inspect sum)
                                                1)
                                            (else (inspect sum)
                                                sum)
                                        )
                                    )
                                )  ) 
                            )
                        )   
                    ))
                ))
            )
            (else sum)
        )   

    )
    (inspect (real ( + 2 (iter 0 0.0))))
)
