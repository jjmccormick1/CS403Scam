(define (main)
        (setPort (open (getElement ScamArgs 1) 'read))
        (define env this)
        (define (iter expr)
            (if (not (eof?)) (begin (eval expr env) (iter (readExpr))))
        )
        (iter (readExpr))
        (env)
)

(define (create i . n)
  ;; treat the second parameter as the accumulator, which is
  ;; null on the first call (so we start with zero)
  (let ((n (if (null? n)
               zero
               (car n))))
    (if (= i 0)
        n
        (create
         (- i 1)
         (lambda (f)
           (lambda (x)
             (f ((n f) x))))))))

