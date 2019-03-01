(define (main)
        (setPort (open (getElement ScamArgs 1) 'read))
        (define n (readExpr))
        (define root (readExpr))
        (pow n root root)
)


(define (pow p num total)
    (cond
        ( ( > p 0) (pow (- p 1) (* num total)) 
          (else total)
        )
    )
)
