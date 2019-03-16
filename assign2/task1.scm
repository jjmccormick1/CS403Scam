(define (main)
        (setPort (open (getElement ScamArgs 1) 'read))
        (define env this)
        (define (iter expr)
            (if (not (eof?)) (begin (eval expr env) (iter (readExpr))))
        )
        (iter (readExpr))
        (env)
)

(define (range start stop step)
    (define (iter num)
        (cond 
            ((or
                (and (> step 0) (< num stop))
                (and (< step 0) (> num stop))
             )
             (cons num (iter (+ num step)))
            )
            (else nil)
        )
    )
    (iter start)
)

(define (for-loop args func)
    (cond 
        ((null? args) nil)
        (else 
            (func (car args))
            (for-loop (cdr args) func)
        )
    )
)
