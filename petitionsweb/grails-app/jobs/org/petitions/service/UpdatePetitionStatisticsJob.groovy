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
		Petition.findAllByClosedOnIsNull().each {
			def addVotes = 0
			it.votes.findAllByProcessedOnIsNull().each { vote ->
				sum = sum + vote.rate
				vote.processedOn = current
				vote.save
			}
			it.numberOfVotes += addVotes / 100
			it.save()

		}

		//TODO that is just POC, should be refactored in Prod
		use (TimeCategory) {
			Date voteToDelDates = current - 31.days
			Vote.findAllByProcessedOnLessThen(voteToDelDates).each { vote ->
				vote.delete()
			}
			RequestDetails.findAllByCreatedOnLessThen(voteToDelDates).each { req ->
				if (!Petition.findAllByRequestDetails(req, readOnly) && !Vote.findAllByRequestDetails(req, readOnly)) {
					req.delete()
				}
			}
		}
	}
}
