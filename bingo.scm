;;; Plans

;; Load scammer achievements from a separate file, so user can define his own ones.
;; Probably the ability to share the score maybe?
;; actual GUI, Dear ImGUI maybe? (now I know repo says it's cli, we can do both anyway.)
;; that's it for now

(display "Scammer Bingo")

;; Load achievements
(load "achievements.scm") ; TODO(zaklaus): Replace with config system.

(define cur-score 0)

(define (driver-loop)
  (begin
    (display (concat "\n\nScore: "
                     (number->string cur-score)
                     "/"
                     (number->string max-score)
                     "\n\n"))
    (print-achievements apairs)
    (display "\nYour input: ")
    (eval-key (trim-string (read-string)))
    (driver-loop)))

(define (eval-key x)
  (if (not (null? ((atable 'lookup) (list (string->symbol x) 'done))))
      (if (eq? ((atable 'lookup) (list (string->symbol x) 'done)) #f)
          (begin
            ((atable 'update!) (list (string->symbol x) 'done) #t)
            (set! cur-score (inc cur-score)))
          (display "You've already selected that!"))
      (display "Not a valid option.")))

(define (print-achievements l)
  (if (null? l) #t
      (begin (display (concat (cdar l)
                       " ["
                       (if ((atable 'lookup) (list (caar l) 'done))
                           "PASSED"
                           "PENDING")
                       "] (Score "
                       (number->string
                        ((atable 'lookup) (list (caar l) 'score)))
                       ")\n"))
             (print-achievements (cdr l)))))
(driver-loop)
