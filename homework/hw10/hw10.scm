(define (accumulate combiner start n term)
    (if (= n 0) start
        (accumulate combiner (combiner start (term n)) (- n 1) term))
)

(define (accumulate-tail combiner start n term)
    (define (helper i total)
        (if (= i 0) total
             (helper (- i 1) (combiner (term i) total)))
    )
    (helper n start)
)

(define (partial-sums stream)
  (define (helper total stream)
    (if (null? stream) nil
        (cons-stream 
            (+ total (car stream))
            (helper (+ total (car stream))
                    (cdr-stream stream))))
  )
  (helper 0 stream)
)

(define (rle s)
  (define (helper s cnt)
    (cond 
        ((null? s) '())
        ((null? (cdr-stream s)) (cons-stream (list (car s) (+ 1 cnt)) nil))
        ((= (car s) (car (cdr-stream s))) (helper (cdr-stream s) (+ 1 cnt)))
        (else (cons-stream (list (car s) (+ 1 cnt))
                           (helper (cdr-stream s) 0)))))
  (helper s 0)
)