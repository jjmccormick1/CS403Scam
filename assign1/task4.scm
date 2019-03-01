(define (main)
        (setPort (open (getElement ScamArgs 1) 'read))
        (define arg1 (readExpr))
        (define arg2 (readExpr))
        (define levels (readExpr))
        (inspect ((crazyTriangle arg1 arg2) levels  ))
        )

(define (crazyTriangle left right)
  (lambda (numLevels)  
        
        ;Finds the value of the number to print
        (define (getNum numLevel numColumn)
            (cond
                ((= numColumns 0) left)  ; If at far left side, return left    
                ((= levels column) right) ;if at far right side, return right
                (else                    ; otherwise, recur
                    (+  (getNum (- numLevel 1) (- numColumn 1)) ;up and over
                        (helper (- numLevel 1) numColumn)        ; above
                    )
                    )
            )
        )
        
        (define (padSpaces numSpaces)
            (cond
                ((> numSpaces 0) 
                    (
                      (print " ")
                      (padSpaces (- numSpaces 1))
                    )
                )
            ) 
        )
        
        (define (printLevel numLevel)
            (cond
                ( (< numLevel numLevels)
                    (
                        (padSpaces (- numLevels numLevel)) ;pad by which level were on
                        (define (printNum num)
                            (cond 
                                (  (<= num numLevel )
                                    (
                                        (print (getNum numLevel num))
                                        (printNum (+ num 1))
                                    )
                                )   
                            )
                        )
                        (printNum 0)
                        (println)
                        (printLevel (+ level 1))
                    )
                )
            )
        )
        (printLevel 0)
    )
)
