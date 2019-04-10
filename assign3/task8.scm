(include "strutils.scm")



(define (main)
        (setPort (open (getElement ScamArgs 1) 'read))
        (define env this)
        (define (iter expr)
            (if (not (eof?)) (begin (eval expr env) (iter (readExpr))))
        )
        (iter (readExpr))
        (env)
)

(define (ramanujan)

)

(define (merge-weighted i j weight)
    (cond 
        ((stream-null? i) j)
        ((stream-null? j) i)
        (else
            (cond
                ((<= (weight (car (stream-car i)) (cdr (stream-car i)))
                     (weight (car (stream-car j)) (cdr (stream-car j))))
                 (cons-stream (stream-car i) 
                            (merge-weighted (stream-cdr i) j weight)
                 ))
                 (else
                    (cons-stream (stream-car j) 
                            (merge-weighted i (stream-cdr j) weight)
                    )
                 )
            )
        )
    )
)
(define (weighted-pairs i j weight)
    (cons-stream 
        (list (stream-car i) (stream-car j))
        (merge-weighted
            (stream-map (lambda (x) (list (stream-car i) x)) (stream-cdr j))
            (weighted-pairs (stream-cdr i) (stream-cdr j) weight)
            weight
        )
    )
)
