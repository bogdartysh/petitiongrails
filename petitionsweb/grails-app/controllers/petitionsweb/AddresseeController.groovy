package petitionsweb

import grails.converters.JSON

import org.petitions.*

class AddresseeController {
	static defaultAction = "index"

	def index() {
		Addressee addressee = Addressee.read(params.id)
		[   addressee: addressee,
			openpetitions:  addressee.petitions.findAll{
				it.closedOn == null && it.seachabilityThresholdReachedOn != null
			}.sort{ it.closedOn },
			failedPetitions: addressee.petitions.findAll{
				it.closedOn != null && (it.seachabilityThresholdReachedOn == null || it.considerabilityThresholdReachedOn == null)
			}.sort{ it.closedOn },
			closedPetitions: addressee.petitions.findAll{
				it.closedOn != null && it.seachabilityThresholdReachedOn != null
			}.sort{ it.closedOn }]
	}

	def all() {
		render Addressee.list() as JSON
	}
}
