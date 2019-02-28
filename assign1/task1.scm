(define (main)
        (setPort (open (getElement ScamArgs 1) 'read))
        (define arg (readExpr))
        (println (color arg))
        )

(define (color arg)
    (cyan arg)
    (yellow arg)
    (magenta arg)
    )

(define (cyan num)
    (inspect (* (cos (/ (pi) (/ num 50))) 255 ))
    )
    
(define (yellow num)

    )
    
(define (magenta num)
    )
    
(define (pi) 
    3.14159265358979323846
    )
