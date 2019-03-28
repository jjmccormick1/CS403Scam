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
            (merge  (map (lambda (subset) (cons (car set) subset))
                        (powerSet (cdr set))
                    )
                    (powerSet (cdr set))
            )
    )
)




(define (merge m n)
    (cond 
        ((null? m) n)
        ((null? n) m)
        ((> (length (car m)) (length (car n))) 
            (cons (car n) (merge m (cdr n)))
        )
        
        (else
            (cons (car m) (merge (cdr m) n))
        )
    )  
)
