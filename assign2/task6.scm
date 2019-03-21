(define (main)
        (setPort (open (getElement ScamArgs 1) 'read))
        (define env this)
        (define (iter expr)
            (if (not (eof?)) (begin (eval expr env) (iter (readExpr))))
        )(setNilDisplay 'nil)
        (iter (readExpr))
        
        (env)
)

(define (powerSet set)
  (if (null? set) '(())
        (append (map (lambda (subset) (cons (car set) subset))
                    (powerSet (cdr set))
                )
                (powerSet (cdr set))
        )
  )
)





