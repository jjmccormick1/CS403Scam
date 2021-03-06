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

(define (quad a b c step)
    (define (iter x)
        (cons-stream (real (+ (* a x x) (* b x) (- c))) (iter (+ x step)))
    )
    (iter 0)
)

(define (integrate str step)
    (define (iter s sum x)
        (define at (stream-car s))
        (define next (stream-car (stream-cdr s)))
        (define add (+ sum (* step (/ (+ at next) 2))))
        (cons-stream add (iter (stream-cdr s) add (+ x step)))
    )
    (cons-stream (real 0) (iter str 0 0))
)

(define (derivate str step const)
    (define (iter s prev)
        (define next (- (* 2 (/  (stream-car s) step)) prev))
        (cons-stream next (iter (stream-cdr s) next))
    )
    (iter str const)
)
