;;; Temp workaround for achievements

(define atable (make-table eq?))

(define max-score 0)
(define apairs '())

(define (install-achievement key f-score f-name)
  (begin
    (set! max-score (+ max-score f-score))
    ((atable 'insert!) (list key 'name) f-name)
    ((atable 'insert!) (list key 'score) f-score)
    ((atable 'insert!) (list key 'done) #f)
    (set! apairs (cons (cons key f-name) apairs))))

(install-achievement 'e 1 "Do (e)ach and everything")
(install-achievement 'c 1 "(c)md.exe")
