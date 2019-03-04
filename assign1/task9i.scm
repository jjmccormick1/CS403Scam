 
(define (main)
        (setPort (open (getElement ScamArgs 1) 'read))
        (define arg (readExpr))
        (define ram  (ramanujani arg))
        (println "(ramanujani " arg ") is " (fmt "%.25f" ram) )
        (println "$4$")
)

(define (ramanujani depth)
    (define (iter src store)
        (cond
            ( (> src 0)
                (iter 
                    (- src 1)
                    (* src
                        (sqrt (+ (+ src 5) store))  
                    )
                )
            )
            (else store)
        )
    )
    (iter (+ 1 depth) 0)
)
