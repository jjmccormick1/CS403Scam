 (define (main)
        (setPort (open (getElement ScamArgs 1) 'read))
        (define env this)
        (define (iter expr)
            (if (not (eof?)) (begin (eval expr env) (iter (readExpr))))
        )
        (iter (readExpr))
        
        (env)
)

(define (matrix-*-vector m v)
    (map (lambda (x) (dot-product x v)) m)
)

(define (matrix-*-matrix m v)
    (let ((cols (transpose m)))
        (map (lambda (x) (matrix-*-vector cols x)) v)
    )
)

(define (transpose m)
    (accumulate-n cons nil m)
)

(define (dot-product v w)
    (accumulate + 0 (map * w v))
)

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence))
      )
  )
)


(define (accumulate-n op initial sequences)
  (if (null? (car sequences))
    nil
    (cons (accumulate op initial (map car sequences))
          (accumulate-n op initial (map cdr sequences))
          )
    )
  )
