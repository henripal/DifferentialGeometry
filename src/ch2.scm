
;; defining the manifold as a plane
(define R2 (make-manifold R^n 2))
(define R2->R (-> (UP Real Real) Real))

;; then the patch around the origin
(define U (patch 'origin R2))

;; our two coordinate systems
(define R2-rect (coordinate-system 'rectangular U))
(define R2-polar (coordinate-system 'polar/cylindrical U))

;; and the transformations between them
(define R2-rect-chi (chart R2-rect))
(define R2-rect-chi-inverse (point R2-rect))
(define R2-polar-chi (chart R2-polar))
(define R2-polar-chi-inverse (point R2-polar))

;; Now let's show that functions on manifolds
;; do not depend on the coordinate system
(define f (compose (literal-function 'f-rect R2->R) R2-rect-chi))
;; r2-rect-chi is our chart: manifold->R2
;; our function on R2 is f-rect: r2->r
;; therefore the manifold function is f(m->r), the composition of both

(define R2-rect-point (R2-rect-chi-inverse (up 'x0 'y0)))
;; chi inverse: R2->manifold

(define corresponding-polar-point
  (R2-polar-chi-inverse (up (sqrt (+ (square 'x0) (square 'y0)))
                            (atan 'y0 'x0))))

;; naming coordinate functions
(define-coordinates (up x y) R2-rect)
(define-coordinates (up r theta) R2-polar)

;; note: x, y, r, theta are functions that will take a point on the manifold and extract
;; their coordinates in a smart manner

;; this allows the definition of functions in terms of these functions
(define h (+ (* x (square r)) (cube y)))

;;;;;;;;;;;;;;; EXERCISES ;;;;;;;;;;;;;;;;;
;; 2.1.a)
((- (square (+ (square x) (square y))) (* 2 (square 'a) (- (square x) (square y)))) ((point R2-polar) (up 'r 'theta)))
;; 2.1.b)
(define-coordinates (up r theta z) R3-cyl)
(define-coordinates (up x y z) R3-rect)
;; the definition of the helix in cylindrical coordinates is trivial
;; the conversion is as follows:
((- (up r z) (up 'R (* 'a theta))) ((point R3-rect) (up 'x 'y 'z)))
#|
;;(up (+ (* -1 R) (sqrt (+ (expt x 2) (expt y 2)))) (+ (* -1 a (atan y x)) z))
|#
;; 2.2
;; reminder: chart goes from manifold to Rn
;; and point goes from Rn to manifold
;; this is just the inverse of the incantation written in the book :)
((compose (chart R2-polar) (point R2-rect) (chart S2-Riemann) (point S2-spherical)) (up 'theta 'phi))
#|
;;(up (/ (sin theta) (+ -1 (cos theta))) (atan (* -1 (sin phi)) (* -1 (cos phi))))
|#
