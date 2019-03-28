 (define (main)
        (setPort (open (getElement ScamArgs 1) 'read))
        (define env this)
        (define (iter expr)
            (if (not (eof?)) (begin (eval expr env) (iter (readExpr))))
        )
        (iter (readExpr))
        (env)
)

(define (Stack)
    (cons nil 0)
)

(define (pop stack)
    (cons (cdr (car stack)) (- (cdr stack) 1))
)

(define (push stack in)
    (cons (cons in (car stack)) (+ (cdr stack) 1))
)

(define (speek stack)
    (car(car stack))
)

(define (empty? stack)
    (eq? (cdr stack) 0)
)

(define (ssize stack)
    (cdr stack)
)

(define (Queue)
    (define l (Stack))
    (define r (Stack))
    (cons l r)
)

(define (enqueue q in)
    (cons (push (car q) in) (cdr q))
)

(define (dequeue q)
    (cond 
        ((not (empty? (cdr q)))
            (cons (car q) (pop (cdr q)))
        )
        (else 
            (dequeue (revers q))
        )
    )
)

(define (qpeek q)
    (cond 
        ((not (empty? (cdr q)))
            (speek (cdr q))
        )
        (else 
            (qpeek (revers q))
        )
    )
)


(define (qsize q)
    (+ (ssize (car q)) (ssize (cdr q)))
)

(define (revers q)
    (cond 
        ((not (empty? (car q)))
            (revers (cons (pop (car q)) (push (cdr q) (speek (car q)))))
        )
        (else q)
    )
)
