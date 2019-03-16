(define (node value left right)
        (define (display) (print value))
        this
)

(define (newBST value)
        (node value nil nil)
)

(define (displayBST root)
    (define (iter root indent)
            (if (valid? root)
                (begin
                    (iter (root'right) (string+ indent "    "))
                    (print indent)
                    ((root'display))
                    (println)
                    (iter (root'left) (string+ indent "    "))
                    )
                )
            )
    (iter "")
)

(define (insertBST root val)
    (define (iter nd)
        (cond 
            ((> nd'value val)
                (if(nd'node nd'value 
        )
    )
)
