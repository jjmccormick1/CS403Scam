(define (main)
        (setPort (open (getElement ScamArgs 1) 'read))
        (define arg (readExpr))
        (println "(cyan " arg ") is " (cyan arg))
        (println "(yellow " arg ") is " (yellow arg))
        (println "(magenta " arg ") is " (magenta arg))
        (println "(cym " arg ") is " (cym arg))
        )

(define (cym arg)
        (string+ "#" (hex (cyan arg)) (hex (yellow arg)) (hex (magenta arg)))
    )

(define (cyan num)
    ; = 255*cos( num*pi / 200)
    (int (* (cos (/ ( *  num (pi)) 200)) 255 ))
    )
    
(define (yellow num)
    (int (* 255 (+ 1 (* -1 (sin (* (pi) .01 num))))))
    )
    
(define (magenta num)
    (int (/ (* 255 (+ 1 (cos (/ (* 3 (pi) num) 200)))) 2))
    )
    
(define (pi) 
    3.14159265358979323846
    )

(define hexVals "0123456789ABCDEF")
    
(define (hex func)
    (string+ (getElement hexVals (int (/ func 16)))
             (getElement hexVals (int (% func 16))))
             )

    
(define (exprTest # $expr target)
   (define result (catch (eval $expr #)))
   (if (error? result)
      (println $expr " is EXCEPTION: " (result'value)
         " (it should be " target ")")
      (println $expr " is " result 
         " (it should be " target ")")
      )
)
