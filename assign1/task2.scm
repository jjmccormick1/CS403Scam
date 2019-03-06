(define (main)
        (setPort (open (getElement ScamArgs 1) 'read))
        (define threshold (readExpr))
        (define r (readExpr))
        (define s (readExpr))
        (println "((mandelbrot " threshold ") " r " " s ") is " ((mandelbrot threshold) r s ))
        )


(define (mandelbrot thresh)
  (lambda (x y)
    (define (iter r s t)
      (cond
        ((= t thresh) 0)
        (else 
            (cond
                ((> 4 (+ (* r r) (* s s))) (iter 
                                                (+ x (- (* r r) (* s s)))
                                                (+ y (* r s 2))
                                                (+ 1 t)
                    )
                )
                (else t)
                )
            )
         )
      )
    ; call with default values 0.0 for r and 0.0 for s
    (iter 0.0 0.0 0)
)
)
