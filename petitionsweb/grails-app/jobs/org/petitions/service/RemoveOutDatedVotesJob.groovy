package org.petitions.service


import org.petitions.*
import groovy.time.*
import grails.transaction.Transactional
import org.petitions.*

@Transactional

class RemoveOutDatedVotesJob {
	static triggers = {
		simple repeatInterval: 24*60*60*1000l // execute job once in 5 seconds
	}

	def sessionRequired = false
	def concurrent = false


	def execute() {
		use (TimeCategory) {
			Date voteToDelDates = new Date()// - 31.days
			def reqsToCheck = [] as Set
			org.petitions.Vote.findAllByProcessedOnLessThan(voteToDelDates).each { vote ->
				reqsToCheck.add(vote.requestDetails)
				vote.delete()
			}

			reqsToCheck.each { req ->
				if (req.createdOn < voteToDelDates && !Petition.findByRequestDetails(req) && !Vote.findByRequestDetails(req)) {
					req.delete()
				}
			}
		}
	}
}
