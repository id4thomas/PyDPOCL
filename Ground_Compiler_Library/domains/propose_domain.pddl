(define (domain propose)
    (:types person place ring - object
        element - object
        step literal - element)
    (:predicates
        (place ?place - place)
        (person ?person - person)
        (has ?person - person ?ring - ring)
        (stolen_by ?person - person ?ring - ring)
        (like ?p1 - person ?p2 - person)
        (love ?p1 - person ?p2 - person)
        (brave ?p1 - person)
        (happy ?p1 - person)
        (jealousy ?p1 - person)
        (delighted ?p1 - person)
        (desperate ?p1 - person)
        (proposed ?p1 - person ?p2 - person)
        (wait_accept ?p1 - person ?p2 - person)
        (propose_accepted ?p1 - person ?p2 - person)
        (at ?o1 - object ?o2 - object)
        (= ?o1 ?o2 - object)
        )

    (:action walk
        :parameters (?person - person ?from ?to - place)
        :precondition (and (at ?person ?from)
                           (not (= ?from ?to)))
        :effect(and (at ?person ?to)
                    (not (at ?person ?from))))

    (:action buy_ring
        :parameters (?person - person ?o1 - ring ?place - place)
        :precondition (and (at ?o1 ?place)
                           (at ?person ?place)
                           (brave ?person))
        :effect (and (has ?person ?o1)
                     (not (at ?o1 ?place))))

    (:action sing_for
        :parameters (?person1 - person ?person2 - person ?place - place)
        :precondition (and (at ?person1 ?place)
                           (at ?person2 ?place)
                           (love ?person1 ?person2)
                           (brave ?person1)
                           (desperate ?person1))
        :effect (delighted ?person2))

    (:action propose
        :parameters (?lover - person ?loved - person ?place - place ?ring - ring)
        :precondition (and (at ?lover ?place)
                           (at ?loved ?place)
                           (love ?lover ?loved)
                           (brave ?lover)
                           (has ?lover ?ring))
        :effect (and(proposed ?lover ?loved)))

    (:action fall_in_love
        :parameters (?loved - person ?lover - person)
        :precondition (and (like ?loved ?lover)
                           (delighted ?loved))
        :effect (and(love ?loved ?lover)))

    (:action steal
        :parameters (?thief - person ?person - person ?place - place ?ring - ring)
        :precondition (and (at ?thief ?place)
                           (at ?person ?place)
                           (has ?person ?ring)
                           (jealousy ?thief))
        :effect (and (not (has ?person ?ring))
                      (stolen_by ?thief ?ring)
                      (desperate ?person)
                      (not (at ?thief ?place))))

    (:action give_ring
        :parameters(?lover - person ?loved - person ?place - place ?ring - ring)
        :precondition(and (has ?lover ?ring)
                          (at ?lover ?place)
                          (at ?loved ?place)
                          (proposed ?lover ?loved)
                          (love ?lover ?loved))
        :effect (and (wait_accept ?lover ?loved)
                      (happy ?loved)))

    (:action accept_ring
        :parameters(?loved - person ?lover - person ?place - place ?ring - ring)
        :precondition(and(wait_accept ?lover ?loved)
                         (has ?lover ?ring)
                         (at ?lover ?place)
                         (at ?loved ?place)
                         (love ?lover ?loved)
                         (love ?loved ?lover))
        :effect (and (has ?loved ?ring)
                     (not (has ?lover ?ring))
                     (propose_accepted ?lover ?loved)
                     (happy ?lover)))

    (:action accept_propose
        :parameters (?loved - person ?lover - person ?place - place)
        :precondition (and (at ?lover ?place)
                           (at ?loved ?place)
                           (proposed ?lover ?loved)
                           (delighted ?loved)
                           (desperate ?lover)
                           (love ?lover ?loved)
                           (love ?loved ?lover))
        :effect (and (propose_accepted ?lover ?loved)
                      (happy ?lover)
                      (not (desperate ?lover))))

)
