package org.petitions.service

import grails.transaction.Transactional
import groovy.time.*

@Transactional
class DdosLimiterService {

	def serviceMethod() {
	}

	Date newPetitionsBlockedOn
	Date newVotesBlockedOn

	int maxPetitionsAddedHourly = 1000
	int maxVotesAddedHourly = 10000

	int hourlyPetitionQty = 0
	int hourlyVotesQty = 0

	Date updatedOn = new Date()


	def isAddingVotePermitted() {
		use (TimeCategory) {
			Date now = new Date()
			Date oneHourAgo = now - 1.hours
			if (oneHourAgo > updatedOn) {
				updatedOn = now
				hourlyPetitionQty = 0
				hourlyVotesQty = 0
				newPetitionsBlockedOn = null
				newVotesBlockedOn = null
				return null
			}
		}

		if (newVotesBlockedOn == null) {
			hourlyVotesQty++
			if (hourlyVotesQty > maxVotesAddedHourly) {
				newVotesBlockedOn = now
			}
		}

		newVotesBlockedOn
	}

	def isAddingPettionPermitted() {
		use (TimeCategory) {
			Date now = new Date()
			Date oneHourAgo = now - 1.hours
			if (oneHourAgo > updatedOn) {
				updatedOn = now
				hourlyPetitionQty = 0
				hourlyVotesQty = 0
				newPetitionsBlockedOn = null
				newVotesBlockedOn = null
				return null
			}
		}

		if (newPetitionsBlockedOn == null) {
			hourlyPetitionQty++
			if (hourlyPetitionQty > maxPetitionsAddedHourly) {
				newPetitionsBlockedOn = now
			}
		}

		newPetitionsBlockedOn
	}
}
