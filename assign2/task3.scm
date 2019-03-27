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

(define (ssize stack)
    (cdr stack)
)

(define (Queue)
    (cons nil 0)
)

(define (enqueue q in)
    (define sz (+ (cdr q) 1))
    (define str (append (car q) (list in) ))
    (cons str sz)
)

(define (dequeue q)
    (define sz (- (cdr q) 1))
    (define str (cdr(car q)))
    (cons  str sz)
)

(define (qpeek q)
    (car (car q))
)


(define (qsize q)
    (cdr q)
)
