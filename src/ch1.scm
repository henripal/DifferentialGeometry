(define ((Lagrange-equations Lagrangian) w)
  (- (D (compose ((partial 2) Lagrangian) (Gamma w)))
     (compose ((partial 1) Lagrangian) (Gamma w))))

(define ((Gamma w) t)
  (up t (w t) ((D w) t)))

(define ((L-harmonic m k) local)
  (let ((q (coordinate local))
        (v (velocity local)))
    (- (* 1/2 m (square v))
       (* 1/2 k (square q)))))

(define (proposed-solution t)
  (* 'a (cos (+ (* 'omega t) 'phi))))

(define ((sphere->R3 R) state)
  (let ((q (coordinate state)))
    (let ((theta (ref q 0)) (phi (ref q 1)))
      (up (* R (sin theta) (cos phi))
          (* R (sin theta) (sin phi))
          (* R (cos theta))))))

(define ((F->C F) state)
  (up (time state)
      (F state)
      (+ (((partial 0) F) state)
         (* (((partial 1) F) state)
            (velocity state)))))

(define (Lsphere m R)
  (compose (Lfree m) (F->C (sphere->R3 R))))

(define ((Lfree mass) state)
  (* 1/2 mass (square (velocity state ()))))
