(include "strutils.scm")
(define intstr (cons-stream 0 (add-streams ones intstr)))

(define (main)
        (setPort (open (getElement ScamArgs 1) 'read))
        (define env this)
        (define (iter expr)
            (if (not (eof?)) (begin (eval expr env) (iter (readExpr))))
        )
        (iter (readExpr))
        (env)
) 

(define (smush str op)
    (define (iter s count accum)
        (cons-stream 
            (stream-car count)
            (cons-stream
                (stream-car s)
                (cons-stream
                    accum
                    (iter (stream-cdr s) (stream-cdr count) (op accum (stream-car s)))
                )   
            )
        )    
    )
    (iter str intstr (stream-car str))
)
