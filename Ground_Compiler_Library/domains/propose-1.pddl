(define (problem propose-1)
    (:domain propose)

    (:objects Bob Mary Jack - person
              park street shop - place
              proposering - ring
              )
    (:init
        (at Bob street)
        (at Mary park)
      	(at Jack street)
	      (at proposering shop)
        (brave Bob)
        (love Bob Mary)
        (love Jack Mary)
        (like Mary Bob)
        (jealousy Jack))

    (:goal (and (propose_accepted Bob Mary)
                (happy Mary))))
