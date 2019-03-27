(define (main)
        (setPort (open (getElement ScamArgs 1) 'read))
        (define env this)
        (define (iter expr)
            (if (not (eof?)) (begin (eval expr env) (iter (readExpr))))
        )
        (iter (readExpr))
        (env)
)


(define (let*->lambdas expr)
    (define vars (car (cdr (car (cddr expr)))))
    (define body (cddr (car (cddr expr))))
    (cond  
        ((eq? (caar (cddr expr)) 'let*)
         (append (cons (car expr) (list (car (cdr expr))))
                (list (iter vars body)))
        )
        (else expr)
    ) 
)
(define (iter var body)
    (cond 
            ((=  1 (length var))
            (define ret (append (list (append (cons 'lambda (list (list (car (car var))))) body)) (cdr (car var))))
            ret
            )
            (else
            
            (define ret (append (list (append (cons 'lambda (list (list (caar var)))) (list (iter (cdr var) body)))) (cdr (car var))))
            ret
            )
    )
    
)                  
