(define (main)
        (setPort (open (getElement ScamArgs 1) 'read))
        (define func (eval (readExpr) this))
        (define arg1 (readExpr))
        (define arg2 (readExpr))
        (define arg3 (readExpr))
        (define arg4 (readExpr))
        (println "(((((curry " func ") " arg1 ") " arg2 ") " arg3 ") " arg4 ") is "
            (((((curry func) arg1) arg2) arg3) arg4)
        )
)

(define (curry func)
    (lambda (a)
        (lambda (b)
            (lambda (c)
                (lambda (d)
                    (func a b c d)
                )
            )
        )
    )
)
