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

(define (push stack in)
    (cons (cons in (car stack)) (+ (cdr stack) 1))
)

(define (speek stack)
    (car(car stack))
)

(define (pop stack)
    (cons (cdr (car stack)) (- (cdr stack) 1))
)

(define (empty? stack)
    (eq? (cdr stack) 0)
)

(define (ssize stack)
    (cdr stack)
)

(define (Queue)
    (cons nil 0)
)

(define (enqueue q in)
    (cons (append (car q) (list in)) (+ (cdr q) 1))
)

(define (dequeue q)
    (cons (cdr(car q)) (- (cdr q) 1))
)

(define (qpeek q)
    (car (car q))
)

(define (empty? q)
    (eq? (cdr q) 0)
)

(define (qsize q)
    (cdr q)
)
