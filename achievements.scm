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

(install-achievement 'e 2 "Do (e)ach and everything")
(install-achievement 'c 1 "(c)md.exe")
(install-achievement 'n 1 "(n)etwork Protection Service")
(install-achievement 'v 1 "e(v)entvwr")
(install-achievement 'l 1 "(l)ifetime")
(install-achievement 'r 2 "warranty expi(r)ed")
(install-achievement 's 1 "(s)topped services")
(install-achievement 'f 2 "(f)ast support")
(install-achievement 'p 1 "(p)ayment")
(install-achievement 'g 1 "errors and warnin(g)s")
(install-achievement 't 1 "ne(t)stat")
(install-achievement 'i 1 "logme(i)n")
(install-achievement 'o 1 "infecti(o)n")
