(define (main)
        (setPort (open (getElement ScamArgs 1) 'read))
        (define env this)
        (define (iter expr)
            (if (not (eof?)) (begin (eval expr env) (iter (readExpr))))
        )
        (iter (readExpr))
        (env)
)

(define (scoping sym expr)
    (define (iter env)
        (cond 
            ((null? env)
                'undefined)
             ((local? sym env)
                'free)
             (else (iter (dot env __context)))
        )    
    )
    (cond 
        ((local? sym expr)
            'bound)
        (else (iter expr))
    )
)


