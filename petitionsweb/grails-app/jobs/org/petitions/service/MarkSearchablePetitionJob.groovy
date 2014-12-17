package org.petitions.service



class MarkSearchablePetitionJob {
    static triggers = {
      simple repeatInterval: 60*1000l // execute job once in 5 seconds
    }

    def sessionRequired = false
	def concurrent = false


	def execute() {
		org.petitions.Petition.findAllByClosedOnIsNullAndSeachabilityThresholdReachedOnIsNull().each { pet ->
			if (pet.thresholdToBeConsidered <= pet.numberOfVotes + pet.numberOfShares) {
				pet.considerabilityThresholdReachedOn = new Date()
				pet.save()
			}
		}
	}
