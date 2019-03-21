(define (main)
        (setPort (open (getElement ScamArgs 1) 'read))
        (define env this)
        (define (iter expr)
            (if (not (eof?)) (begin (eval expr env) (iter (readExpr))))
        )
        (iter (readExpr))
        (env)
)

(define (let*->lambdas function)
    (if (equal? (car (caddr function)) 'let*)
    ; keep the original define
    (append
      (cons (car function)
        ; keep the original parameters list
        (cons (cadr function)
          (cons 
            (map (lambda (x) (cons 'lambda (list  (car x)))) (cadr (caddr function)))
            nil
            )
          )
        )
      (cddr (caddr function))
      )
    )
)
