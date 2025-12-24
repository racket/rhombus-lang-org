#lang racket/base
(require racket/class
         racket/draw
         file/ico)

(define o-bm (read-bitmap "rhombus-logo.png"))
(define w (send o-bm get-width))
(define h (send o-bm get-height))

(define s (max w h))
(define bm (make-bitmap s s))
(send (send bm make-dc) draw-bitmap o-bm (quotient (- s w) 2) (quotient (- s h) 2))

(define (to-ico size)
  (define new-bm (make-bitmap size size))
  (define dc (send new-bm make-dc))
  (send dc set-smoothing 'smoothed)
  (send dc scale (/ size s) (/ size s))
  (send dc draw-bitmap bm 0 0)
  (define bstr (make-bytes (* size size 4)))
  (send new-bm get-argb-pixels 0 0 size size bstr)
  (argb->ico size size bstr))

(write-icos (list (to-ico 16)
                  (to-ico 32)
                  (to-ico 48))
            "favicon.ico"
            #:exists 'truncate)
