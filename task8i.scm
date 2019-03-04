 (define (main)
        (setPort (open (getElement ScamArgs 1) 'read))
        (define arg (readExpr))
        (print "(ecfi " arg ") is ")
        (println (fmt "%.25f" (efci arg)) )
)

(define (efci num)
    (define (iter depth sum)
        (cond 
             ((<= depth num) 
                (real (iter (+ depth 1 ) 
                    (real (/ 1 
                        (+ 1
                            (/ 1 
                                (+  (* 2 (- (+ 1 num) depth))
                                    (/ 1 
                                       sum
                                    )
                                )  
                            )
                        )   
                    ))
                ))
            )
            (else sum)
        )   

    )
    (real ( + 2 (iter 0 1)))
)
