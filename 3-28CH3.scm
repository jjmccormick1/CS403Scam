;; 1/1 -1/3 + 1/5 - 1/7 + 1/9 .... should sum to pi/4
(define ones (cons-stream 1 ones))
(define twos (cons-stream 2 ones))
(define alt-ones 
    (cons-stream 1 (cons-stream -1 alt-ones))
)
(define odds (cons-stream 1 (combine-streams + twos odds)))

(define (// a b) (/ (real a) (real b)))
(define (sdisplay z n)
    (cond
        ((= n 0) (println "..."))
        (else 
            (print (stream-car z) " ")
            (sdisplay (stream-cdr z) (- n 1))
        )
    )
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
(define (ps s) 
    (cons-stream (stream-car s) (combine-streams + (stream-cdr s) (ps s)))
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
(define pi-stream (combine-streams // alt-ones odds))
(define pi/4 (ps pi-stream))
(define accpi/4 (st (ps pi/4)))
(define superaccpi/4 (stream-map stream-car (tt st (ps pi/4))))

(define wholes (cons-stream 0 (add-streams ones wholes)))

(define (pairs s t)
    (cons-stream
        (list (stream-car s) (stream-car t))
        (shuffle 
            (stream-map (lambda (x) (list (stream-car s) x)) (stream-cdr t))
            (pairs (stream-cdr s) (stream-cdr t))
        )
    )   
)

(define (shuffle s t)
    (cons-stream
        (stream-car s)
        (shuffle t (stream-cdr s))
    )   
)

(define (shuffle2 s t)
    (define a (stream-car s))
    (define b (stream-car t))
    (cond
        ((< (cadr a) (cadr b))
            (cons-stream a (shuffle2 (stream-cdr s) t))
         (< (cadr b) (cadr a))
            (
)
