package petitionsweb

import grails.converters.JSON

import org.petitions.*

class AddresseeController {
	static defaultAction = "index"

	def index() {
		Addressee addressee = Addressee.read(params.id)
		[addressee: addressee, openpetitions:  addressee.petitions.findAll{it.closedOn == null}, closedPetitions: addressee.petitions.findAll{it.closedOn != null}]
	}

	def all() {
		render Addressee.list() as JSON
	}
}
