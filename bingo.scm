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
    (display "\nYour input(W - Win): ")
    (eval-key (char-lowercase (read-char)))
    (if (= cur-score max-score) (winner) #f)
    (driver-loop)))

(define (compliment)
  (begin
    (define (n) (/ (* 1.0 cur-score) max-score))
    (cond
     ((= cur-score 0) "Is he/she really a scammer?")
     ((< (n) 0.2) "Well, that isn't really right.")
     ((and (>= (n) 0.2) (< (n) 0.5)) "Now you saw how to scan wirus, right?")
     ((and (>= (n) 0.5) (< (n) 0.8)) "That scammer is really dumb")
     ((and (>= (n) 0.8) (< (n) 0.9)) "SYSKEY!!!!")
     ((and (>= (n) 0.9) (< (n) 0.95)) "DUMB THREATENING!")
     ((>= (n) 0.95) "YOU HAVE WIRUS ON YOUR COMPUTER, WHERE IS YOUR DEXTOP???"))))

(define (eval-key x)
  (if (eq? x #\w) (winner)
      (if (not (null? ((atable 'lookup) (list (char->symbol x) 'done))))
          (if (eq? ((atable 'lookup) (list (char->symbol x) 'done)) #f)
              (begin
                ((atable 'update!) (list (char->symbol x) 'done) #t)
                (set! cur-score (+ cur-score ((atable 'lookup) (list (char->symbol x) 'score)))))
              (display "You've already selected that!"))
          (display "Not a valid option."))))

(define (winner)
  (begin
    (display (concat "Game over! Scammer's score is "
                     (number->string cur-score)
                     " out of "
                     (number->string max-score)
                     "\nStatus: " (compliment) "\n"
                     "!\nDo you want to start a new round? (y/n)"
                     ))
    (if (eq? (char-lowercase (read-char)) #\y)
        (begin
          (load "achievements.scm")
          (set! cur-score 0)
          (driver-loop))
        (exit 0))))

(define (print-achievements l)
  (if (null? l) #t
      (begin (display (concat
                       " -: "
                       (cdar l)
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
