; Lab 13: Final Review - Optional Questions

; Q6
(define (nodots s)
  (cond 
    ((null? s) nil)
    ((not (pair? s)) (cons s nil))
    ((pair? (car s)) (cons (nodots (car s)) (nodots (cdr s))))
    (else (cons (car s) (nodots (cdr s)))))

)

; Q7
(define (has-cycle? s)
  (define (pair-tracker seen-so-far curr)
    (cond ((null? curr) #f)
          ((contains? seen-so-far curr) #t)
          (else (pair-tracker (cons curr seen-so-far) (cdr-stream curr))))
    )
  (pair-tracker nil s)
)

(define (contains? lst s)
  (cond ((null? lst) #f)
        ((eq? s (car lst)) #t)
        (else (contains? (cdr lst) s)))
)

; Q8
(define-macro (switch expr cases)
    'YOUR-CODE-HERE
)