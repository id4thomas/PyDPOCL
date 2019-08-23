(define (domain diaper_domain)
    (:types  character product location element - object
    step literal - element
		)
    (:predicates
        (character ?character - character)
        (location ?location - location)
        (at ?character - character ?location - location)
        (instock ?product - product ?location - location)
        (purchased ?product - product ?character - character)
        (refunded ?product - product ?character - character)
        (have ?product - product ?character - character)
        (= ?o1 ?o2 - object)
        (isstore ?location - location)
        (need ?product - product ?character - character)
        )

    (:action move
        :parameters (?character - character ?from ?to - location)
        :precondition (and (at ?character ?from)
                      (not (= ?from ?to))
                    )
        :effect(and (at ?character ?to)
                    (not (at ?character ?from))))

    (:action purchase
        :parameters (?character - character ?product - product ?location - location)
        :precondition (and (at ?character ?location)
                      (instock ?product ?location)
                      (isstore ?location)
                      (need ?product ?character)
                      (not (purchased ?product ?character)))

        :effect(and (have ?product ?character)
                    (not (instock ?product ?location))
                    (purchased ?product ?character)))

    (:action find_spare
      :parameters (?character - character ?product - product ?location - location)
      :precondition (and (at ?character ?location)
                          (not (isstore ?location))
                          (have ?product ?character)
                          (need ?product ?character)
                          )
      :effect (not (need ?product ?character))
    )

    (:action refund
        :parameters (?character - character ?product - product ?location - location)
        :precondition (and (at ?character ?location)
                           (have ?product ?character)
                           (isstore ?location)
                           (not (need ?product ?character)))
        :effect (and (instock ?product ?location)
                    (refunded ?product ?character)
                    (not (have ?character ?product))))

)
