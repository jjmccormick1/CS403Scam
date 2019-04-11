(include "strutils.scm")
(define tmp (cons-stream 2 (add-streams twos tmp)))
(define bytwos (cons-stream 1 tmp))
(define (main)
        (setPort (open (getElement ScamArgs 1) 'read))
        (define env this)
        (define (iter expr)
            (if (not (eof?)) (begin (eval expr env) (iter (readExpr))))
        )
        (iter (readExpr))
        (env)
) 

(define (mystery x)
    
)

