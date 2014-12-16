package org.petitions.service

import org.petitions.*
import groovy.time.*
import grails.transaction.Transactional
import org.petitions.*

@Transactional
class UpdatePetitionStatisticsJob {
	static triggers = { simple repeatInterval: 5000l // execute job once in 5 seconds
	}

	
	def sessionRequired = false
	def concurrent = false

	def execute() {
		Date current = new Date()
		Petition.findAllByClosedOnIsNull().each { it ->
			def addVotes = 0
			it.votes.each { vote ->
				if (!vote.processedOn) {
					addVotes = addVotes + vote.rate
					vote.processedOn = current
					vote.save()
				}
			}

			it.numberOfVotes += addVotes / 100 
			it.save()
		}
	}
}
