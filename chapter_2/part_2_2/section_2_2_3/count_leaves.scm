(define (count-leaves-old x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves-old (car x))
                 (count-leaves-old (cdr x))))
  )
)


;; Using accumulate
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op 
                      initial 
                      (cdr sequence))
      )
  )
)

(define (count-leaves t)
  (accumulate   +
                0 
                (   map (lambda (node) 
                          (if (pair? node) 
                              (count-leaves node) 
                              1)
                        )
                    t
                )
  )
)
