 (define (main)
        (setPort (open (getElement ScamArgs 1) 'read))
        (define arg (readExpr))
        (println (fact arg))
        )

(define (fact n)
        (if (< n 2) 1 (* n (fact (- n 1))))
        )
