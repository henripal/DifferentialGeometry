;; Chapter 3: Vector Fields and 1-Form Fields
;; Main point here is coordinate independence.
;; Ex the potential energy of a multiple pendulum is a function on a manifold
;; so its 'derivative' should be coordinate indpendent

;; Definition:
;; A vector is an operator that takes directional derivatives of manifold functions
;; at its anchor point
;; It is an operation `v` taking a function f and a manifold point m and shoots
;; out a real, the directional derivative of f at m: v(f)(m)

;; we can express this in a given coordinate system;
;; if chi is the chart sending the manifold to Rn
;; chi^i is the individual coordinate sending the manifold to R
;; then v(chi^i) is also a function sending the manifold to R
;; chi-inv is a function from Rn to the manifold, so v(chi^i) o chi-inv
;; takes a point from Rn and returns the directional derivative along direction
;; i in the Rn coordinate systemz2
(define R2->R (-> (UP Real Real) Real))

(define (components->vector-field components coordsys)
  (define (v f)
    (compose (* (D (compose f (point coordsys)))
                components)
             (chart coordsys)))
  (procedure->vector-field v)) ;; a procedure is defined. we want an
;; operator, thus we make it with the procedure->vector-field thingie

;; (define v
;;   (components->vector-field
;;    (up (literal-function 'b^0 R2->R)
;;        (literal-function 'b^1 R2->R))
;;    R2-rect))
;; this is a shorthand for what is above:
(define v (literal-vector-field 'b R2-rect))

(define R2-rect-point ((point R2-rect) (up 'x0 'y0)))

;; Coordinate Representation:
;; v is applied to a function, and produces a function of the manifold to R
;; it has a coordinate representation _v_, which is applied to
;; the function from Rn to R and returns a function from Rn to R

(define (coordinatize v coordsys)
  (define ((coordinatized-v f) x)
    (let ((b (compose (v (chart coordsys))
                      (point coordsys))))
      (* ((D f) x) (b x))))
  (make-operator coordinatized-v))

(define-coordinates (up x y) R2-rect)

(define-coordinates (up r theta) R2-polar)
