(define (main)
        (setPort (open (getElement ScamArgs 1) 'read))
        (define arg1 (readExpr))
        (define arg2 (readExpr))
        (define levels (readExpr))
        (println "((crazyTriangle " arg1 " " arg2 ") " levels ")")
        ((crazyTriangle arg1 arg2) levels  )
        )

(define (crazyTriangle left right)
  (lambda (numLevels)  
        
        ;Finds the value of the number to print by recursively 
        ;calcualting value
        ; Does tree in shape of 
        ;         1
        ;       1 2
        ;     1 3 2
        ;   1 4 5 2
        (define (getNum numLevel numColumn)
            (cond
                ((= numColumn 0) left)  ;return left if at far left
                ((= numLevel numColumn) right) ;return right if at far right
                (else                       ;Or we recur
                    (+  (getNum (- numLevel 1) numColumn) ;Go find the val directly above
                        (getNum (- numLevel 1) (- numColumn 1)) ;Go find val above and to the right
                    )
                    )
            )
        )
        
        (define (padSpaces numSpaces)
            (cond
                ((> numSpaces 1)
                    (print " ")
                    (padSpaces (- numSpaces 1))
                )
            ) 
        )
        (define (printLevel numLevel)
            (cond
                ( (< numLevel numLevels)
                        (padSpaces (- numLevels numLevel)) ;pad by which level were on. number of spaces to pad is equal to our level in tree
                        (define (printNum num)
                            (cond 
                                (  (<= num numLevel )
                                        (print (getNum numLevel num))
                                        (cond 
                                            ( (< num numLevel )
                                              (print " ")
                                            )
                                        ) 
                                        (printNum (+ num 1))
                                )   
                            )
                        )
                        (printNum 0)
                        (println)
                        (printLevel (+ numLevel 1))
                    
                )
            )
        )
        (printLevel 0)
    )
)
