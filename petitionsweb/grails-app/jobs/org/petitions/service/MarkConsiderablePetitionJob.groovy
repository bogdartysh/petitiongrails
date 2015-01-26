package org.petitions.service


import org.petitions.*
import groovy.time.*
import grails.transaction.Transactional
import org.petitions.Petition

@Transactional
class MarkConsiderablePetitionJob {
	static triggers = {
		simple repeatInterval: 1 * 60 * 60 * 1000l // execute job once in 5 seconds
	}

	def sessionRequired = false
	def concurrent = false


	def execute() {
		org.petitions.Petition.findAllByClosedOnIsNullAndConsiderabilityThresholdReachedOnIsNull().each { pet ->
			if (pet.thresholdToBeConsidered <= pet.numberOfVotes + pet.numberOfShares) {
				pet.considerabilityThresholdReachedOn = new Date()
				pet.save()
			}
		}
	}
}
