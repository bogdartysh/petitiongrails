package org.petitions.service

import org.petitions.*
import groovy.time.*
import grails.transaction.Transactional
import org.petitions.Petition

@Transactional
class MarkSearchablePetitionJob {
    static triggers = {
      simple repeatInterval: 60*1000l // execute job once in 5 seconds
    }

    def sessionRequired = false
	def concurrent = false


	def execute() {
		org.petitions.Petition.findAllByClosedOnIsNullAndSeachabilityThresholdReachedOnIsNull().each { pet ->
			if (pet.thresholdToBeConsidered <= pet.numberOfVotes + pet.numberOfShares) {
				pet.seachabilityThresholdReachedOn = new Date()
				pet.save()
			}
		}
	}
}