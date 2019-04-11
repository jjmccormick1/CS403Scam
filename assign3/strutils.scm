 
(define ones (cons-stream 1 ones))
(define twos (cons-stream 2 twos))
(define ints (cons-stream 1 (add-streams ones ints)))
(define alt-ones 
    (cons-stream 1 (cons-stream -1 alt-ones))
)
(define odds (cons-stream 1 (combine-streams + twos odds)))

(define (// a b) (/ (real a) (real b)))
(define (sdisplay n z)
    (print "(")
    (define (iter x t)
        (cond
            ((= x 0) (print "..."))
            (else 
                (print (stream-car t) ",")
                (iter (- x 1) (stream-cdr t))
            )
        )
    )
    (iter n z)
    (print ")")
)
(define (sref z n)
    (cond
        ((= n 0) (stream-car z))
        (else 
            (sref (stream-cdr z) (- n 1))
        )
    )
)
(define (combine-streams op s t)
    (cons-stream
        (op (stream-car s) (stream-car t))
        (combine-streams op (stream-cdr s) (stream-cdr t))
    )    
)
(define (partial-sum s) 
    (cons-stream (stream-car s) (combine-streams + (stream-cdr s) (partial-sum s)))
)

(define (st s)
    (define s0 (sref s 0))
    (define s1 (sref s 1))
    (define s2 (sref s 2))
    (cons-stream 
        (/ (- (* s2 s0) (* s1 s1)) (+ s2 (- (* 2 s1)) s0))
        (st (stream-cdr s))
    )    
)
(define (tt xform s)
    (cons-stream s (tt xform (xform s)))
)

(define (stream-map f s)
    (cons-stream 
        (f (stream-car s))
        (stream-map f (stream-cdr s))
    )   
)

(define (add-streams a b)
    (combine-streams + a b)
)

(define (shuffle s t)
    (cons-stream
        (stream-car s)
        (shuffle t (stream-cdr s))
    )   
)
