(define (main)
        (setPort (open (getElement ScamArgs 1) 'read))
        (define env this)
        (define (iter expr)
            (if (not (eof?)) (begin (eval expr env) (iter (readExpr))))
        )
        (iter (readExpr))
        (env)
)

(define (curry func @)
    (cond (
            (=  (length @) (length (get 'parameters func)))
            (apply func @)
          )
          (else   
            (define out @)
            (lambda (@) (apply curry  (cons func (append out @))))
          )
          
    )
)
