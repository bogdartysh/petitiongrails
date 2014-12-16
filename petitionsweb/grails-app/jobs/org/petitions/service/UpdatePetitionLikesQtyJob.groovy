package org.petitions.service


import org.petitions.*
import grails.transaction.Transactional

@Transactional
class UpdatePetitionLikesQtyJob {
    static triggers = {
      simple repeatInterval: 5000l // execute job once in 5 seconds
    }

    def sessionRequired = false
    def concurrent = false

    LikeCounterService likeCounterService

    def execute() {
        Petition.findAllByClosedOnIsNull().each { it ->
			likeCounterService.updateSharesQty(it)
			it.save()
	}
    }
}
