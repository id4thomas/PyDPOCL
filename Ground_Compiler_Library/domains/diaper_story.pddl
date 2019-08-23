(define (problem diaper_story)
    (:domain diaper_domain)

    (:objects A B - character
              Ahome Bhome Shop - location
              Diaper - product)

    (:init
        (at A Ahome)
        (at B Bhome)
        (instock Diaper Shop)
        (isstore Shop)
        (need Diaper A)
        (need Diaper B)
        )

    (:goal (and (at B Bhome)
          (at A Ahome)
          (purchased Diaper B)
          (purchased Diaper A)
          (have Diaper A)
          (refunded Diaper B)
          (not (instock Diaper Shop))
          )
    ))
