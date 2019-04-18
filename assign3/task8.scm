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

(define (weight x)
    (define l (car x))
    (define r (cdr x))
    (+ (* l l l) (* r r r))
)

(define (ramanujan)
    (define pair (weighted-pairs ints ints +))
    (sdisplay pair 10)
    (define (iter str)
        (define current (stream-car str))
        (define next (stream-car (stream-cdr str)))
        (cond
            ((= (weight current) (weight next))
                (cons-stream (weight current) (iter (stream-cdr str))))
            (else (iter (stream-cdr str)))
        )        
    )
    (iter pair)
)


(define (merge-weighted i j weight)
    (cond 
        ((stream-null? i) j)
        ((stream-null? j) i)
        (else
            (cond
                ((> (weight (car (stream-car i)) (cdr (stream-car i)))
                     (weight (car (stream-car j)) (cdr (stream-car j))))
                 (cons-stream (stream-car j) 
                            (merge-weighted  i (stream-cdr j) weight)
                 ))
                 (else
                    (cons-stream (stream-car i) 
                            (merge-weighted  (stream-cdr i) j weight)
                    )
                 )
            )
        )
    )
)
(define (weighted-pairs i j weight)
    (cons-stream 
        (cons  (stream-car i) (stream-car j))
        (merge-weighted
            (stream-map (lambda (x) (cons (stream-car i)  x)) (stream-cdr j))
            (weighted-pairs (stream-cdr i) (stream-cdr j) weight)
            weight
        )
    )
)
