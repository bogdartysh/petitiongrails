package org.petitions.service


import org.petitions.*
import groovy.time.*
import grails.transaction.Transactional
import org.petitions.*

@Transactional
class RemoveOutDatedNotStartedPetitionsJob {
	static triggers = { simple repeatInterval: 24 *60 * 60 *1000l // execute job once in 5 seconds
	}

	def sessionRequired = false
	def concurrent = false


	def execute() {
		use (TimeCategory) {
			Date voteToDelDates = new Date() - 31.days
			org.petitions.Petition.findAllByClosedOnIsNullAndConsiderabilityThresholdReachedOnIsNull().each { pet ->
				if (pet.numberOfVotes < pet.thresholdToBeConsidered &&
				pet.createdOn < voteToDelDates ) {
					pet.closedOn = new Date()
					pet.closedDue = "too.few.votes"
					pet.save()
				}
			}
		}
	}
}
