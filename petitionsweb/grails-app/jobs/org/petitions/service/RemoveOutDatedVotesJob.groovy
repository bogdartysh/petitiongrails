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
			Date voteToDelDates = new Date() - 31.days			
			org.petitions.Vote.findAllByProcessedOnLessThan(voteToDelDates).each { vote ->
				vote.delete()
			}
		}
	}
}
