(define (main)
        (setPort (open (getElement ScamArgs 1) 'read))
        (define env this)
        (define (iter expr)
            (if (not (eof?)) (begin (eval expr env) (iter (readExpr))))
        )
        (iter (readExpr))
        (env)
)


(define (create i @)
    (let ((n (if (null? @)
               zero
               (car @))))
        (if (= i 0)
            n
            (create
                (- i 1)
                (lambda (f)
                    (lambda (x)
                        (f ((n f) x))
                    )
                )
            )
        )
    )
)
(define zero
  (lambda (f)
    (lambda (x) x)))
    
(define pred
    (lambda (n)
        (lambda (f)
            (lambda (x)
                (((n (lambda (g) (lambda (h) (h (g f)))))
                    (lambda (u) x))
                        (lambda (u) u)
                )
            )
        )   
    )
)
