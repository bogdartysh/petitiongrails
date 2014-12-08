package petitionsweb

import grails.converters.JSON

import org.petitions.*

class AddresseeController {
	static defaultAction = "index"

	def index() {
		[addressee: Addressee.get(params.id)]
	}

	def all() {
		render Addressee.list() as JSON
	}
}
